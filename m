Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23233C65FD
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865697; cv=none; b=Z4XHzF7XQj6EH3iHIoRwR6xJMHAeo1RekI0GErI2tVJVr+L+cT4OhX4l3EEdDsk52+WZ0N80bUZcjm0WEqUSNqR3tuiObEtPSMeu0q63ZE93r2WZhkoQhTL8HR6ognyIYPd47QFmEyYGny+cDT+nLRCP9k2X03/yqnC1vQ+2w4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865697; c=relaxed/simple;
	bh=rYkzRcW245ELcqnW206enFLVoi53VbyHIjf+wFoTPok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RixPL8CZfNsxkexLIEO36Aut5dWNufOCqfZhplrX3xe9kTlB1x/ce4L1JLPvtiwWEmw+2fTcxwP1TBVI+kVvXo4XIXk9UxYFEQfJxAIBenSHkfBmAiK2s9awLeFitikJMjD7ViSsqRbkDPb4O+0lmXeNCkSJXGSmNEOIokY/0kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpRp9e1X; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpRp9e1X"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82ae378fff8so2735485b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865694; x=1775470494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZezNnVQNhmXmaIcjRNqOna668OUhlUp70Pxauy9gTQ=;
        b=jpRp9e1X5knqWzbGGzppcH+P3WLgZVHJ5F8ZtUxgybCayfP0kGTkiyJJeV51cCE8fC
         lLhQ0QlbxbDQ+5/EjY6h2mFTEHQZQeDr9IrTNoQhRRjn7MrGWLFkiaUh/G0DFQHkOncf
         TtOqSySk8jJmHHhoGiej7BtdDLBCB5Ql/eCjDCtzfMTkWNkc8tIKlERB4h8luwrswGis
         daZMsB4+atfRc4+wLjljo7OKViMeANtiUeqvavAHme4YmbEDGHvINDfI52E7s4Cx+5rt
         Tp1EqB4x2rkh9VMyDuukPhSJd/h3RNVp4od8d2FMjMWQLWnAQ0OvAvKB203DlBt6RMIe
         hlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865694; x=1775470494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZezNnVQNhmXmaIcjRNqOna668OUhlUp70Pxauy9gTQ=;
        b=oH6DelF3z5i80tKCL54LKO5A4ZWhq/qb/xpfgGLQnX+fHsOGasFIjHUTHw2RgA7/WU
         niUNHU3sDJaFGV3derlc20PRDkQcyYPX5xehWY4EuIqgrLN/ZnTYEllLOP07JnEczfX0
         92F4FwVYfNf8r+sK+QVNmOLhx4cRN8cZvpdlHcZ73cJUfa/ebUwmuejJNXKpH5NEbNaK
         kpDlO88RzvwG6dKQXGCUFr8Xo/32lhNEZMN9hZX8DFgEMZWiaf6lzILdeqTyeP+n+Pt/
         ZIXeVKCy4tJaHa4MetxK5EoL+a9ZUUjoOQjvX0jbRBLZoG9PkNWhVSGdBNI8N5fkFS/c
         JfWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHEvVkbdMT4CFxxM10hgH4jRhZAmxev+Z8leyJ68Ha9IyzyVANQtuaXImfAouqvJYjdCf5K1ebq20=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUBt1Rl8p5ZRCPmb1lmeRyAoJ+0zLX+42xt3NtnZ8fjEYjSGds
	1FUZlzDDsTkwYBSmyHq/yfqmW9JzW+TDz0A4o0J+BQP2le+RerTka5NB
X-Gm-Gg: ATEYQzxbS8exrBSW5R6BAPHKb3KeTiRwf/1OFi/gFRrJtXNJElFMBH9ymMZLSeGbrc7
	eHcy6RRQxswoJL9wJnIeai1NlEJK1ur/F8uzJNtSlOWL1XFBtFTAvhXTYeH+EuRYS0fSGcOMUgR
	eHnxdqOaM4IbmgT2BYrBvTSDLNNiM8jQ8vnI6oOkMN3+mIEWCfTJ4JJFg23kHaB6pFnYu084RrP
	I6snCLcvy+P4i5Y2FqnXWuu7ml9iHtECj/C2Whnh9s58degxV444Mbl6yWqyRcta1R3ZpiYc7N/
	CR9AahZG4XyxbjWpOx/YdfKI3x1kx3agjovV9xhqa0dIQy+2WhybMD0S3V0Sp2pumrBrS7m3l3y
	23F1Xc77IsSNRPivWHUcqlOcvCiD9g2J3c/D7Ka7SWwJkgNGN5nSIipw1jpGxQ+2v+PzL05Y9Eo
	41422mtCPY7tBvrQXu7+K9BnsxNUyu
X-Received: by 2002:a05:6a00:2e18:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82c95d3974fmr11984562b3a.17.1774865694152;
        Mon, 30 Mar 2026 03:14:54 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:53 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:52 +0000
Subject: [PATCH v3 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-5-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1398;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=rYkzRcW245ELcqnW206enFLVoi53VbyHIjf+wFoTPok=;
 b=+0vgH3skU4ycp9nWrCr78txopZ6GUChHC1xjVO+8+tmuAJhd3X+0Sd35xvcmDK41qmuT2NngW
 EQ9DxSsP+YKDR+PEDZjOimrpKCrM57VJY1ef2DzH4Pm8lYSKyJvoTau
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The USB-C port is used for powering external devices and transfer
data from/to them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 88691f1fa3a1..f66ff5f7693b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -116,6 +116,33 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		port {
+			pmi632_hs_in: endpoint {
+				remote-endpoint = <&usb_dwc3_hs>;
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1000000>;
+	status = "okay";
+};
+
 &pmi632_vib {
 	status = "okay";
 };
@@ -316,3 +343,7 @@ &uart4 {
 &usb3 {
 	status = "okay";
 };
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};

-- 
2.53.0

