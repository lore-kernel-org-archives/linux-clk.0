Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFFE3A1D16
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804929; cv=none; b=qg/polB3+YZ/zFVc3sCkS0uH219cuRRISzxPxoPEsNai33Ix/Be7j2eLFqTqiRtak2VZUEi2oMf1f5pqXBKIPK/zcVTVdW7ZKM4StFVRoPdEanQpge9U8RqhnyTyBVe4BwtA5wdZubcy+aKdyVN7/uHX//Bl1qAnzwLlQ6QsoQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804929; c=relaxed/simple;
	bh=sh6CHOb16k/4gSZCp2k+BEa4Dkc0sI/mIZiIfX6yj8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7rr9xAsXarIdt1PAtmTAG+doOU5OuRtRAj6KakXZQZv1jFVPBGwSKSAv1tmfuB4U6UTDZMeHPdwkPz9YjqiJE4mFLTFxrf1ijApNxmeLUfCecpQnJGp/+RIRevRoWihj1vxmRPY9HYqXLA5JD5swCIJOO1dgNmCee4G0ZDlUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FL0TuqvY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FL0TuqvY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b9b1900bso4158177f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 05:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772804925; x=1773409725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NLCQ6pVVPeDAMvh5rjRXQzwrKOPpCKjM6nme7d/FUk=;
        b=FL0TuqvYEQRCJVcnkV6MltEaP6XCq7evLzjYp7hV8teD9SN1p8WVarZcIunc6EdwfV
         oeYtCGnnquUkhrcvkkBEOK0t32Duh58cDneI8T8w+6Ht1mt2PqudsjSD/gT6ipIjPw2Q
         WzWCoRH51Ed/hPNLf3jqqhit+0/AzsLZ3ZRMd/1xfOPkDDTirhKQ/0f9g62KRbsksWQh
         xHR4vzk3T0jEdsIOfYqIfKdgx9l38Nenu+8uYdUtHPeOPPL2dO/YLm4YZyeOymzbMorx
         1vzZmYGRHDX/cQQwKKPqcUqDqUqr5Hb+1+scq8LIOOKPmXEbsQeJF8Fg7mH7Ql8plwJP
         ZGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804925; x=1773409725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0NLCQ6pVVPeDAMvh5rjRXQzwrKOPpCKjM6nme7d/FUk=;
        b=bavNrbRDUVZescaqf2PjmeZSLKgm8FoQGhHhT/xQAyMhjpUI8H4Xxd3wb5RUBXaw6A
         oeListNZ8i3udo58W5TuEWEs4Ccin62lq1eYUCoAcLGjISZcGg3QUifZ9Xfy4wVw3fue
         NHJaYPA3TZfGUvnmGcOtQZTxpQBjGqarc1L6oQR0tn3EtWQGrUV1EMzagI8lpi/k3+dD
         ADCyUaLKJ553jGYvpd34wVymlqZCC7AUfyWwFMcgad09mToTHgk5jgVzXDZmuSPi4l/z
         LN1ATzF7TMcOubJ2kr1x7Fu/AX7ZSX6bA47uOZwx7S/l9VoGn5flXlAkUZlVhVwNnKoK
         Vocg==
X-Forwarded-Encrypted: i=1; AJvYcCWpKqOeovWFvHxfs0TR+D3qsSObKa5hD1aqrx/f3jCnrVxOopZve3EhZj2tXWd+dvc1m8gepgN/Qk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGQ7h2kH3Pa7YFJ6p3Nvp480nKniVNifcs0waiVUW6GseVTrOb
	0A0soLxPCbPKsOe7wFe6jVghhH34GWq+SjYBWWGzg2f+3Z/kc9rDc3q7LZn2Wdo2Z3Q=
X-Gm-Gg: ATEYQzwPFi8JI1/JfIt26tNvnkL0ZqH4R3/I9LdQLCp0m0/kJT5/FfuURrXZYhin2am
	H2o6Eir2CO+AmbBQFyTmili8m89CpOhILdDWyMat5ShkjOKTsIYyrcbmBu6coO0EYz2aUCJ+Ab8
	IueLSGWbaQkZVLthpBT00BpFTU4J5Q0eHrL3inTeXL1UnwW/L0u/ww/dvH0SVn6CiduXZDwvoZS
	3VlbhCJ8IVVE5+AIrtvHShUBxDCSGNFzVbv6UtzGlymzH4OWiW+x7PodEeApBE6Fmfwxy/ApmSU
	BI/NpzmTVgSTJu0yZQPY3tqR3JWoNHkCL1j7RJKqlXD4bbS64cOvJ3NMIDDl9Px5FYlGyxYEEA5
	WBu8UR1BtBKAxpULittVoPu8K6DYr1c9BtSqFFsXM4KaRz5+hnDOW4v2UsV83pI6yj0LDrsVwf5
	P9eZwLHLaJJ6/vGeKLP+7KucoNV8bJlpc4QZ/fWI6e5wDNOJc6UHrYpvsbHq5tDX0QDQry7fjou
	ytp
X-Received: by 2002:adf:f74c:0:b0:439:ddc0:4bee with SMTP id ffacd0b85a97d-439ddc04d31mr1328872f8f.16.1772804925037;
        Fri, 06 Mar 2026 05:48:45 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8daf2sm4304767f8f.2.2026.03.06.05.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:48:44 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 14:48:39 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: milos: Add GX clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-gxclkctl-v1-3-00b09ee159a7@fairphone.com>
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772804920; l=942;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sh6CHOb16k/4gSZCp2k+BEa4Dkc0sI/mIZiIfX6yj8k=;
 b=Rwk6ksYDrCy/cThAXlHI6XclEqEjFdyZIsN3Mj2VOEbOOYEO9KGJX1gdo6C++nUkWEidEBRdB
 oQSI5ukXauxDMw/IUpmkGg7SRWOspAU7NUong4soUzWJeEfr7rjyWFF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the GX clock controller, which provides a power domain to
consumers.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index e1a51d43943f..621f05820826 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1224,6 +1224,16 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,milos-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,milos-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.53.0

