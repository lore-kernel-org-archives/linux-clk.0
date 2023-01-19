Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8F1C38142
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 09:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjASJAG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 04:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjASJAE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 04:00:04 -0500
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA856796A
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 01:00:03 -0800 (PST)
Received: from toolbox.toradex.int ([31.10.206.125]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1M4JBN-1pI9Zd4Bzl-000KPT;
 Thu, 19 Jan 2023 09:54:29 +0100
From:   Marcel Ziswiler <marcel@ziswiler.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v1 0/2] ARM: arm64: dts/clk: imx: indentation permission whitespace cleanup 2
Date:   Thu, 19 Jan 2023 09:54:19 +0100
Message-Id: <20230119085421.102804-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vWuOTF3Cmn5I3Dc5W+An3aVQczJy3zXtoUMHW0dXoUy0viH+2s8
 Hw4Bx2mnzqppb6yab8MudfWEpnqe0VOV6+IwkZ9JFF/zp9fsiOAQY4Y/HYp8Z1Z0XShDWk4
 s2Pefynwh/fmGapn7TeWfdG7MLL1h8B7pbv797W5cU3wBIdiB5pTl3cgGOVv/v+mp5pvaEp
 p1bMJVkGvZ5lGSCxYGo4A==
UI-OutboundReport: notjunk:1;M01:P0:ktwZmlrjDrY=;NncWV6KWZuZSAMGulRPx+ILTJ6d
 kr/La0bNz8iOEx9z7DHLg5/XpEwvrgtyKkZo3bgm22YWhBVGkykKnX3RRy35QLLBoS8QWnhGd
 fn+1XHverXOl0Uty3kBffXhQrJ14fvzXbJNdDZXi+oKzNylTOkxpNnm0nXbN7m10xkmW7IKMS
 jz8eWuUeb+eeUirhauMecG3TfLyAu5DXeO0VtZHzIXqkJb4DLBCi2SSUMOLfWWl1LrgiD/bEf
 o+veCGIkQTJf9QZGoZr6gtqsObTT8NfnTBfsRM88w0rtEtADbM1Q7ezXXOiztpF0v2mZn+zhy
 7PHGz3mRXlmYtgQeL8NOJmUJcMJZF4ClIBZjn0736e+1j6YI0hsy9RHxMMmb8p0sO3wcUnXdm
 eyHygxIf9wv74vD49CXWMUFSIOSBS7zkHWH7f2+/GbcBlF3esZY0yU8sAxMXqnmg8wTm52t8A
 M0swYSa6crvKBuBRvc5PHy5mxbB7v2uCcGpkXatpHrxLieLGRDv0x4ZGMbtaxHErcvbO1kdCI
 OvIc/I+MkNmxmpIXLPaUQabrvDUzdJW5XZhWnYxoJMNrwEjN4EhL4mL6T8jfSf1SHQVsQjzHY
 b3hoyC/d5RRJ3PUpd3BC/VSungSr5b1tiSf/1kIBHqySyUe77yIalWs2nlI7EYZq51CbNbF8d
 PozTX2pjggzwHd/dCRoJUQAEK9qGDWJvFAwQmVsuHA==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>


While further synchronising them imx device trees with U-Boot I stumbled
over more checkpatch warnings. This series addresses those trivial
indentation, file permission and/or whitespace cleanups.


Marcel Ziswiler (2):
  clk: imx6sll: add proper spdx license identifier
  dt-bindings: imx8ulp: clock: no spaces before tabs

 include/dt-bindings/clock/imx6sll-clock.h | 2 +-
 include/dt-bindings/clock/imx8ulp-clock.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.36.1

