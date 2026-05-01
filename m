Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2730C3803F1
	for <linux-clk@vger.kernel.org>; Fri,  1 May 2026 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627118; cv=none; b=iV3BgBjR5y3rxnWnEmsjYhZi4ir3vU9E1NX6W9Uq7TJtZPClzFzEReDsBNFSILQHy1gX8qqW+GrW1Hodn3rp+cq1YIjrEpR1jd31+tl7KDDnvzoTIF1XV3wFBdXsGPOCXEODkP+3/9nlqMe/Be3DIV3EgcYG93qEgFduKgf16po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627118; c=relaxed/simple;
	bh=WGw15wnrL3hMI5E1OHDA/5Y1FK0IInxfQr7juzg6tUQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UzH2KbF17bvNOn6/FoZxpxQvsmhIcC1SeBFRustPbG9TmNhirdUp2Vn8/8S2dWow+xWhywen8R8BO7zArYIeBR2jpS8jtZ+tVnmZle+JFem/bsdq7qNXJgS2cOKnAIEV0EgOPNaq+PSdhJWa+rkOD517tzgIUBafKm6MTJiA/Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HRaf4H39; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HRaf4H39"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1394943f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 01 May 2026 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627114; x=1778231914; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDZosYsDgpbdMxXQX/sZK+i7ik/+NlYq5noK0zNARiA=;
        b=HRaf4H39WdELAQDTdStWHUY7iU3sXOISHpXwCeU9xuAI5Ulppv5hrkD52nRlTymc1g
         k98/rV7qOEg6PBNkTOWgcBWMElNg8h5cUopAnmfr9wVYe7sYFe4tHHOAUarjSTms9D2s
         1GJp3wQ/R0Tg7Wu1L/H1ny95lOzsyby9kqcjBXo5MLvtkVWRyJ8ZrGn92E7mzTH+3rjJ
         Dp110nLE+5LsdPOa2jeiKwzCGBV5DXaK05ggi+0K3Z/hL5g3Z7maR0hk4IGGy7ETmg2B
         F4RH+p4C8WT8lbVmRuLkuU4VGjWSLuqj0hTIAGUvyqWuEIrJXsOwMCAY+GmgrdxRkM4N
         TE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627114; x=1778231914;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDZosYsDgpbdMxXQX/sZK+i7ik/+NlYq5noK0zNARiA=;
        b=sTjS4Hj4EzH7wcIzdgr8WCfALGWQpmdSqtQNCbVUVZVz85VUpydKiVE/OalsYYVClp
         yIQna1w6WwcFbAQMF1YH3nfnz29mgzwMdgmei+yEXn0LPX4ZEvJugRYoFpG8r/56qYaF
         t5KjGHUUvOMqbRJQDAiidbMRx2XhFadhm9PViX24p2pi+RtrL/fMHWchlBCZbeDenfjV
         IqWzVOE4AUcRwJ0rhV0AiyVLzPQ9mlmABl0RoTbWOBp4DnrsxcPjQ2FyLGF/bpsx80Ec
         7r2T3Qg7i1e6lQFmOxoQ9jTAnaCqta+V5pLr2wvD7Dv5POxMSQ3A1Pm2Jogg+TNAe5Vm
         Z9MA==
X-Forwarded-Encrypted: i=1; AFNElJ+t67Uim4z+VC5f0u1FrxTktcLCjU+04PiGgVeiBPpY+Fm72wTBcsBjhQsG5iGqdO6D9IGvnzX94qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YypxL3/AFsLxFA5TVmQB7Tc72l10/V28K+zZrG8lawUb2K9fnhh
	MzhYNgK5DorUUpPKLtv0OymNt1kVRyx5u6xW/BYRpCmrlhgG2ruZ3vGVrwd12y1dA9M=
X-Gm-Gg: AeBDies38WAp486RZTZworFTUUQTt6xe92WJRe92w3JBJ28+SgzvTlMRHjZ4jeAScV0
	ZwL2Zh7gpW90vWmb2vXRUoQSKvI0OCn0vnOfImUzvCZfeFTDMe2JDms+V+LcvmlYfEx5PZ6XRQP
	pk66ihynTCp/2B0rIFQe5JKjtP6F2BiPIFS31DFCkFxyBij9pLPguibbkxkf4jVu/bBxmSE8fiK
	XhQTIQ8oWhHZdD4e9LJj/qoWysnNOfJd5bmMeSpcysUgsENFH95JKal+u/h7Mu1e6t/yAopIV9R
	oc/jAG9QTMj0gXJiRSotTQcgLTePFLpfLRqECypO42sO4gpTEZf0t2LI9DkkcH5DmM3XU0rrgZe
	qo6ZocgGffzkOV2iaAChsFwlf2DdaGfXuwgBXEnS5QT8sQWaogOAoesb9aFopesRe8rHMQ88KFA
	DYZtZ31RyXSA5IboSd6TCgQR7XYt12kIqnmcB848cqTZPQHWUd+FwcuW1lG8cZWF9CgEw/kNEa4
	nA6QPHyJK2SkQ9ALu0=
X-Received: by 2002:a5d:5f91:0:b0:449:fb9e:4b4e with SMTP id ffacd0b85a97d-44a85d97773mr3498972f8f.15.1777627114550;
        Fri, 01 May 2026 02:18:34 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Support enabling interconnect path for GDSC for
 fixing Milos camcc
Date: Fri, 01 May 2026 11:18:28 +0200
Message-Id: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQrCMBBEf6Xs2Ug21iqe+h/SQ5rs2gXblESCU
 vLvxt49zOENzJsNEkWhBLdmg0hZkoSlgjk04Ca7PEiJrwxGm04jdmqWZ0jK2dk5JTW+xdEzn5D
 4CnW1RmJ578b7UHmS9Arxsx9k/LX/XRmVVq3W44Wdx3Nne7YS1yksdHRhhqGU8gWfxpmOsgAAA
 A==
X-Change-ID: 20260116-milos-camcc-icc-d41bdff31ef8
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1757;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WGw15wnrL3hMI5E1OHDA/5Y1FK0IInxfQr7juzg6tUQ=;
 b=y9ZOv7Hz76149N7Pj/D9PMsrbeI3dZtb7wHBWIaRE92i7fwvPhqmH/Q9tyA9kVEcFZD6SwEHZ
 psNpwpDjV8pCCusCyi2SuQMqPN2+E8tgey/9b47aPVmJ9ZvLaL7FV3u
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Some power domains like CAMSS_TOP_GDSC requires the enablement of the
multimedia NoC on newer SoCs like Milos.

Add support for getting an interconnect path as specified in the SoC
clock driver, and enabling/disabling that interconnect path when the
GDSC is being enabled/disabled.

Then specify that dependency in the camcc-milos driver and add it to the
dt-bindings and milos.dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Move icc_set_bw() calls to gdsc_toggle_logic() (Mike)
- Try to make dt-bindings commit message clearer
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com

---
Luca Weiss (5):
      interconnect: Add devm_of_icc_get_by_index() as exported API for users
      dt-bindings: clock: qcom,milos-camcc: Document interconnect path
      clk: qcom: gdsc: Support enabling interconnect path for power domain
      clk: qcom: camcc-milos: Declare icc path dependency for CAMSS_TOP_GDSC
      arm64: dts: qcom: milos: Add interconnects to camcc

 .../bindings/clock/qcom,milos-camcc.yaml           |  8 ++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |  3 ++
 drivers/clk/qcom/camcc-milos.c                     |  7 +++++
 drivers/clk/qcom/gdsc.c                            | 33 ++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h                            |  5 ++++
 drivers/interconnect/core.c                        | 20 +++++++++++++
 include/linux/interconnect.h                       |  6 ++++
 7 files changed, 82 insertions(+)
---
base-commit: 9f5d28c2bae83e051ab7f807c819a634693ebffc
change-id: 20260116-milos-camcc-icc-d41bdff31ef8

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

