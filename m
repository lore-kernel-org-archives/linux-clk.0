Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794004068;
	b=WARUyhGAIEBkh/MR3acTEZ9TMcF8FGNkCws0lyppwtekXXoS0iNwCUpZnuzPTP6DYqLm
	 VbCwRvtfkrQBy9SXYtLIRz8zy1DScZ1ceyGRemh1ac/aEKxYnBrNGXZTtjlud+ARok5zr
	 K3hKt6C0Dq/yKKCXFA2QkaDuxmgdLfz/QPyHjOo5WhXEVm15J+g8D3MZ0Gvgx2J8Fmufw
	 jeSmFwHfi6m414+PkAZ/OuD2Q1OoPU3S4Fw77xhUZrdvV+cz/L/2+WKoqudIj1uxpnSlg
	 Dwk/dvpEzK7kEuMk44CLMqUEG0PwPsXgVWwPhnOaeJUIY6vtjpSCVf5V1bJ7AxQ9qhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794004068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
	b=WIsDG88opuyC6WmtthxXGSPft2glSwZAPpiCeaM5LWei/4bhjFQClxfPHFmI/80ZKA6C
	 NAq7tEpJ/Z04MlHPk/+YQjdTBa8J38P56TQC1IL62n10oC+lXZ9KxhOL1fWI/r/wGGHXe
	 V944JV70f4M0xVfFC33slQBRSh6JHkp9yDSmd5KkJ5jSSIuPgZa7s0HnzwOaZZ3JiLhDh
	 oKrvlZgIbsWn5mzW2EqIV9M8YQg3K+z/q9RQaxJ8I8ppcsbuE48KlSCUGB46jrRTJBov6
	 hGvgkURbpgUWVZ512dNFDsuTJakbSjCb7KVVppmOj3E0s25ZRSO01vn9NY48374kVBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LrO6gz3q;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852DB606A326
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 22:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 852DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LrO6gz3q
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4922523d1afso685662f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794004065; x=1794608865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
        b=LrO6gz3q3TY5UyCJOUBox/jjNcpxcJ2iAUHSQ0uClQVQf0wM2zRmqenKRj+0+YEWiW
         yV2HOJRF3YA+WPieH13BkTkh7BEKnK040T6AxoBSU/NZTmP6uA2l5fW5B3zeTwH+n6wT
         PBK0Fihz1HLsWmo0/C98BGnDAsRDCdtWZrWElYILBY2JcuYZKOBBVwLZEhNzZVRbtkxS
         ug+KkGnyno3GobtlniguEXtAX/Y7ZSWcbFoKp5v+NeQi53SUrFn9GTu/o4mUslsT5GLs
         0CQE0/7Yi5XJ0jYhQ6kvPCXZIIp6raSkr09c0B64iFEt5q+7wtbJkmvR6BWeM5uRL2Zk
         +VhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794004065; x=1794608865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
        b=rHwjtIxMBkAKngOnSPQiO7ho6jrPo4+Br5r1aoXfJAPa5gnVUyXXu4vBmo4mbgQEwd
         h0+Bu6Cl3nKHAgJDdrdpyajv897hMi7nnxuYNqYR70Dvj9KI/Sv8WTYHo4yJDN6akH72
         uldwhIYhbclkXe5/6EjJsyppMSyGWA4chEehhG9VvOKJSP69EaxciR+4vD8GQmNGtsEC
         nQ/gy/O3OaijFyCiyrqne+3i5Ng2K43npBC/ucZX+XQlftP8y8s2vRQKpSElCTKUIaXq
         xMVxJN2D7FGMLlsfSnwN60n41bUM3PVqcoUxCSDRUK8GqrghQZ0qyxN32TsKd0xleJ8p
         J4mQ==
X-Forwarded-Encrypted: i=1; AL+hErEJUF1PiG3Db5Sq/WBtTGD4L1Bdlh5wYCLa+ZghmLAq1Q6gpt3pY9T3oBmfo3hPCMjxYJFowdvD2jU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tCLM3GiD1IVMiCwR/F7q07OJb07ju5Iiis7fn81UNch4q9RbI
	svdNT2Niw8l1YL5h4OvOXFRwvTfH4TFYpShpQ217an2kZyhgNfJfgJJKpptQfL5H6Bo=
X-Gm-Gg: AYBFou00V4CZdRp/2PjArMJw5NiWFbz+sMlGfu4MyGu0dazoToYGSUUrA9+PR54LYJ5
	S3XTCmbJjqX7RR2+rigZ+Tb6NC8Kn9CiLyuN063dTESvPVkPw9jt4pDDs1z4Bq98My/Vw5BOCJC
	OgS6JxO2VZIL0EOlvoQ5BLRM8Pdw2BmHMQcq2AX0ZBWePD7Tb5k9DUwUOFb+2g4JuwISZwkdRc3
	fsN6Eyt5+cqIjlZ/0PPAdJUZkUH7dJv46HhqKhb0APATFiRi0UGlQmHq0DOlFVbmbrHQeGLU19v
	Ol2pRshJCo1MxjuIz0u737Tf42H5UkW9Mm/6ePwu8qmEBgulwC4/R/5JbCRfs5JSHZqbjspJAdF
	4c0toOfZv4OCNKoZuYplQimyDyIdsAuMRI3EpLK9mISs5PmFGwkKSODyuEuPhdfM7vQHVN50B0Y
	/O2QQTQAM4xnUq69Hs1x7dE+lAdU3gcLYu+i20SlLWSi9IJ37we3k9GkuJQNn7w2LLy0A9igvle
	KtxxCkVkPR4YPr8ccK51SyMIdgqYCnbq3lg/Uua1ycGG7NAgeCvdmNBj69zIJeFzJsrHR7W0flq
	6Q6VYp3FJHY6Q19UwziYSga2Q++qYL+U3XU3hHES5YPPJWpEX5OEtYG31DsDmYu3+RyPFTL1slU
	lCDWSJ/lNAZg=
X-Received: by 2002:a5d:5d13:0:b0:490:ef5a:bf39 with SMTP id ffacd0b85a97d-492733d12f2mr5925598f8f.6.1794004064618;
        Fri, 06 Nov 2026 14:27:44 -0800 (PST)
Received: from macbook (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm5497080f8f.28.2026.11.06.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:27:44 -0800 (PST)
Date: Fri, 6 Nov 2026 23:27:38 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <au5RoF6BooP14xhY@macbook>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
 <au4p0xYEFkgEU6T4@macbook>
 <20261106-headband-buckwheat-fecbd459ee85@spud>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-headband-buckwheat-fecbd459ee85@spud>

On Fri, Nov 06, 2026 at 20:48:01 +0100, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 08:34:37PM +0100, Carlo Caione wrote:
> > On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:
> > 
> > > > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > > > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > > > +
> > > > +    soc {
> > > > +        #address-cells = <2>;
> > > > +        #size-cells = <2>;
> > > > +
> > > > +        clock-controller@0 {
> > > > +            compatible = "amlogic,s7-peripherals-clkc";
> > > > +            reg = <0x0 0x0 0x0 0x49c>;
> > > 
> > > What's with the weird numbers in this example?
> > > 
> > > Examples don't have to be real, but when it looks like this the
> > > immediate thought is that the modelling of the device might be
> > > incorrec.t
> > 
> > The numbers are actually real, but the example simply lost their context
> > because I copied the node from the S7 dtsi (not yet submitted), where
> > the controller sits under the APB bus node (bus@fe000000) and the bus
> > ranges make the addresses relative to it.
> > 
> > 		apb: bus@fe000000 {
> > 			compatible = "simple-bus";
> > 			reg = <0x0 0xfe000000 0x0 0x480000>;
> > 			#address-cells = <2>;
> > 			#size-cells = <2>;
> > 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> > 
> > 			clkc_periphs: clock-controller@0 {
> > 				compatible = "amlogic,s7-peripherals-clkc";
> > 				reg = <0x0 0x0 0x0 0x49c>;
> > 				#clock-cells = <1>;
> > 				...
> > 
> > In V2 I'll use an absolute address for the sake of clarity (PLL has the
> > same issue).
> 
> Before you do that, can you please share with me the s7 dtsi? Cos surely
> you've got it in some git repo online somewhere.

The S7 dtsi is already upstream at [0], the peripheral clock controller
and PLL will be enabled in that DTSI with a following series after the
bindings and the drivers in this set are acked, following the diffs that
will be submitted:

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 2c204dcebbba..5f2a61f42cbd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>

 / {
@@ -160,6 +162,22 @@ apb: bus@fe000000 {
                        #size-cells = <2>;
                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

+                       clkc_pll: clock-controller@8000 {
+                               compatible = "amlogic,s7-pll-clkc";
+                               reg = <0x0 0x8000 0x0 0x1e8>;
+                               #clock-cells = <1>;
+                               clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_HDMI_PLL_OSC>;
+                               clock-names = "fix",
+                                             "gp0",
+                                             "hifi",
+                                             "hifi1",
+                                             "hdmi";
+                       };
+
                        uart_b: serial@7a000 {
                                compatible = "amlogic,s7-uart",
                                             "amlogic,meson-s4-uart";

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 5f2a61f42cbd..afc88abea301 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -162,6 +162,40 @@ apb: bus@fe000000 {
                        #size-cells = <2>;
                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

+                       clkc_periphs: clock-controller@0 {
+                               compatible = "amlogic,s7-peripherals-clkc";
+                               reg = <0x0 0x0 0x0 0x49c>;
+                               #clock-cells = <1>;
+                               clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+                                        <&clkc_pll CLKID_FCLK_DIV2P5>,
+                                        <&clkc_pll CLKID_FCLK_DIV3>,
+                                        <&clkc_pll CLKID_FCLK_DIV4>,
+                                        <&clkc_pll CLKID_FCLK_DIV5>,
+                                        <&clkc_pll CLKID_FCLK_DIV7>,
+                                        <&clkc_pll CLKID_HIFI_PLL>,
+                                        <&clkc_pll CLKID_GP0_PLL>,
+                                        <&clkc_pll CLKID_HIFI1_PLL>,
+                                        <&scmi_clk CLKID_GP1_PLL>,
+                                        <&clkc_pll CLKID_HDMI_PLL>,
+                                        <&clkc_pll CLKID_HDMI_PLL_PIX>,
+                                        <&xtal>,
+                                        <&scmi_clk CLKID_ACLKM>;
+                               clock-names = "fclk_div2",
+                                             "fclk_div2p5",
+                                             "fclk_div3",
+                                             "fclk_div4",
+                                             "fclk_div5",
+                                             "fclk_div7",
+                                             "hifi_pll",
+                                             "gp0_pll",
+                                             "hifi1_pll",
+                                             "gp1_pll",
+                                             "hdmi_pll",
+                                             "vid_pix",
+                                             "xtal",
+                                             "axi_frcpu";
+                       };
+
                        clkc_pll: clock-controller@8000 {
                                compatible = "amlogic,s7-pll-clkc";
                                reg = <0x0 0x8000 0x0 0x1e8>;

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi

--
Carlo Caione
