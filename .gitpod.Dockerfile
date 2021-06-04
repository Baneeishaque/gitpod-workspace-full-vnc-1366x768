FROM gitpod/workspace-full-vnc

ENV CUSTOM_XVFB_WxHxD=1366x768x16

RUN sudo sed -i 's/$WINDOW_MANAGER \&/$WINDOW_MANAGER \& >> \/tmp\/$WINDOW_MANAGER.log/g' /usr/bin/start-vnc-session.sh

RUN sudo sed -i 's/Xvfb -screen $DISP ${CUSTOM_XVFB_WxHxD:=1920x1080x16} -ac -pn -noreset \&/Xvfb -screen $DISP ${CUSTOM_XVFB_WxHxD:=1920x1080x16} -ac -pn -noreset \& >> \/tmp\/Xvfb.log/g' /usr/bin/start-vnc-session.sh

RUN sudo sed -i 's/cd \/opt\/novnc\/utils \&\& .\/launch.sh --vnc "localhost:${VNC_PORT}" --listen "${NOVNC_PORT}" \&/cd \/opt\/novnc\/utils \&\& .\/launch.sh --vnc "localhost:${VNC_PORT}" --listen "${NOVNC_PORT}" \& >> \/tmp\/novnc.log/g' /usr/bin/start-vnc-session.sh
