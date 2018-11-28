Return-Path: <SRS0=nz6M=OH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07764C43441
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 18:58:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAEC4205C9
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 18:58:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ORPnWLzE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAEC4205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbeK2GAm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 01:00:42 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46842 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbeK2GAm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 01:00:42 -0500
Received: by mail-pg1-f194.google.com with SMTP id w7so9883104pgp.13
        for <linux-clk@vger.kernel.org>; Wed, 28 Nov 2018 10:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s5w4IN2H7W8bHGPBbVZSOf6yGCi4eThxvzg0kR6f4Dk=;
        b=ORPnWLzEOtNhR2Z8E07sRFXQTwvb+7KTAMy8h+G+SnigHFd6vYQRJl07adqmHmZ5g/
         sLlEFgcHxVtzE0q3bhjqQeyI3L0GpyDfbEwNuHZRRAB59xsZlc4C+JXoOH8DHKLdO1xZ
         OeTnq/PfBBgS9SGlNyJUvM0cOCUTmaq+Nm6Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s5w4IN2H7W8bHGPBbVZSOf6yGCi4eThxvzg0kR6f4Dk=;
        b=rBPMMv/K4C0YHK8ZeZpSH0vK8QPd4g/+639jvn1HvzSNKuA9OCL1UIO12ZFW8OC91D
         /unQu7iIGZkgDO573RRscgQjTYMl4Soi9JoR4i+uOsJc3aCNWsAVx8PC3ZnAaUod6tLL
         jyu3O8NVlsYrfinuY8tUDqAdIUAzQQPzKdTaWcaI17rYt6SGWyQXrM5EMSHuuyDvp342
         HQg5/pdXK7SFZKVnTjl9IKV4Vwj45Ky1dMu/k01I19/Rgyg+FW/DAqjy0yhjgn3eaEZm
         UInFpC1Tx+q2Kak7vNHxktLcy+sl1jsopBnkUaz0DsH375tILIPYqQYTQB9qCQoOg8ws
         GyYw==
X-Gm-Message-State: AA+aEWbH/po0JUZE0HoCo8SEQCwk2j+lK0/YTuiRGt8QPmBjBAji0Nwr
        s24D8N/omD7LSf+zB+QYhUoa+g==
X-Google-Smtp-Source: AFSGD/ViFzCTzgFemv+Mv4raYZFfi443LSS3nw/HOXRLZodnt2sY4IIlLiBIwccuaEtunULlBz6d0Q==
X-Received: by 2002:a62:3948:: with SMTP id g69mr4371089pfa.114.1543431484179;
        Wed, 28 Nov 2018 10:58:04 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:c8e0:70d7:4be7:a36])
        by smtp.gmail.com with ESMTPSA id f6sm13204214pfg.188.2018.11.28.10.58.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Nov 2018 10:58:03 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        "Kristian H . Kristensen" <hoegsberg@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Amit Nischal <anischal@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Fix the xo parent in gpucc example
Date:   Wed, 28 Nov 2018 10:57:42 -0800
Message-Id: <20181128185743.75328-1-dianders@chromium.org>
X-Mailer: git-send-email 2.20.0.rc0.387.gc7a69e6b6c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In the bindings that landed for the gpucc we require that the XO clock
(one possible parent of the gpucc) be listed.  The code doesn't use
this yet--this is just to allow us to move toward the day when it does
use it.  What the code does do today is to hardcode the parent name to
"bi_tcxo".  That's all well and good.

...but the example in the bindings shows this clock mapping to the
clock "xo_board".  On the current sdm845.dtsi file the "xo_board"
clock is a fixed clock with an output name of "xo_board".  The clock
with the name "bi_tcxo" is actually provided by the RPMh Clock
Controller.  Presumably that's the one that was wanted.

Let's update the example to make this clearer.

Fixes: e431c92188a9 ("dt-bindings: clock: Introduce QCOM Graphics clock bindings")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/clock/qcom,gpucc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
index 9d0358cc08b4..4e5215ef1acd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
@@ -17,6 +17,6 @@ Example:
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
-		clocks = <&xo_board>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
 		clock-names = "xo";
 	};
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog

