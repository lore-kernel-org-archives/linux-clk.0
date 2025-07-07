Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43604295D85
	for <linux-clk@vger.kernel.org>; Mon,  7 Jul 2025 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882229; cv=none; b=krQCnjTQy/9ZrJMm0LkNBnDXmr+gH8Vca6eYd6tvZ1hfYE1V3Wp0vpwm+L3u88baT4iK4IGA0D3XV1419wQjQkTnESWdDoh0J7bnGe8Vdcv/W/FmWeeIZ/DfTmHOvH8+jIQ6iRX5XFHHWjCygl2FwZOps8fVSxQ57Pw8zTDg8xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882229; c=relaxed/simple;
	bh=3Mu2inPeLurTgxYIMXmvWJLeE7eR7Fy6XDeF6vArhtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXyy1BHKW+xACm2TwEEqs3zDm0XVtsRFv91fay7ijTN/TlUwKbld8hVp7jte11RO+lxwc9L1tbinrNzFURrx7oGo0rkIS4gQDCo7GQ8MSBUA2VhSLV/OFBd+mgO7NjVMUNC3BHiJd58UBoul5OJHKcEmP4h64JwfyeZD9iRdTDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iyEYlPkF; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iyEYlPkF"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so587701066b.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Jul 2025 02:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751882225; x=1752487025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOnXjDsqREhCmFz88p49UNo+eXUiRZ56Bd8zYTlBpIA=;
        b=iyEYlPkFwUyAwTcMUvc97NQ6mZcgozgZfTX0JFclFwPj0oSZtjX/JbqZJpETRaRRby
         YEbqmfxvwPF6TCMwNxzPnsa0o3Opk1iv3fXuRV6Lwg2SwK48FnwR/XhOm22NrMb74kDQ
         ePNR/zFNKGRzBH5fk1VVK9qVbzTielD+ESYltioF5j6DVntVug/Kexisg4mAxgcm7tCg
         BnKWvj8Xti5XhKIRUlTZtGcg+4tsWAvOWx4ZmUG7NzsgkN+RcoNB/83BMZDMQ0LBl5Cw
         Pxl33yNqTpsIytR8Hq5qJjxHFdvCvYBX8QknIc7euv4vsYD7P95iQFWz59GEtSC0hwR6
         +R/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882225; x=1752487025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOnXjDsqREhCmFz88p49UNo+eXUiRZ56Bd8zYTlBpIA=;
        b=aHcOFApEAbE6UPx+oeddyEHHLgmQQh1bEaw9Hkeet8RKyp50oCX19tezG/Bir/AwUo
         Q7YMU6otwZsKzrxsoDxmbWxRiT6mSGHdu7eqaLibr5Zh7WFxH+TXj7whj6jXl95MjDlc
         NxNrEKKgFHchKZzFUCrTGnEX//dR92O+apmgVLaQ3TROw9IIF90PZLsJ8vRq/5aMqm0G
         1WJ2LEKQk3Np8o99aVxzdObkQafH56nvojwwg0q7QURB0R0MbmV2Tb+sewNY647NUSvE
         rNGwo4aYlHrFCjBsmhP9+FsxcfYqyBC6K/tWz7mlmnu/qarCdX71K/29tdQ42+RWOYdp
         M4YQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4VAi0TZH+nU3nXCyeCzJhaExPr2Xkj8Yl8twwg4RnGoxOdf1suJumMI1ePPvc7OZcGf9uX0+6B3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZPBxgex26tnsUqLbyo0Bphf47f/rURKO9EO9gJN+kn6qQ/en
	kN7KtKUNfgYhQDnhjScCvTR+IVhi6aTCBrAjA7j9uv9Mt3XiopQK21EdCCBp0lQdREEPL3foqr5
	n/Qb7
X-Gm-Gg: ASbGncss/F8jtC3wpbSeRkm3mlI0R5/vGKokskbirzC6nSLFnPqDsJBYlcWNf3++B4P
	HaeG+bOeijRzVLwcQHBaVKupNrAXz8zznYJK0i75xfZY0GWl6X5mZJqVupARaYYg36sfMICcKBS
	vDVqJ07RT/88f1rgXLvIksLs4NasNdl6q4N72qWfffZhTphJKa4KC2rArPa1VTg5OThCTf+IDVX
	z7EebWKOayVwS/LnPFlIHfd7dhMISBKfrg+7TzT8HVkuDT7lRcg9Utd2pcAmZRk7XN3KywH2j0v
	LF/uXCnHdf4U6AFxn4jFQnkz1VDd2J0T45sxidz2TeJBPecIHIQLb/UqhDfZ8/j7ZWuwmGmL2ac
	lJX0NBZbxrB1WCQdjDhCY6xCbUXnRrvaf
X-Google-Smtp-Source: AGHT+IGKhMhFSGKlsIJ79aw5G6QurSRw8NCQFcx3lleMs7147mX87cuyeRhXpjtmLkhn9V0f7LM0PQ==
X-Received: by 2002:a17:907:e90:b0:ae3:eab4:21ed with SMTP id a640c23a62f3a-ae3f80acbf7mr1348668966b.11.1751882225465;
        Mon, 07 Jul 2025 02:57:05 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6641fbsm5235815a12.3.2025.07.07.02.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:57:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 07 Jul 2025 11:56:40 +0200
Subject: [PATCH v2 4/4] clk: qcom: tcsrcc-sm8650: Add support for Milos SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-sm7635-clocks-misc-v2-4-b49f19055768@fairphone.com>
References: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
In-Reply-To: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751882221; l=1444;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3Mu2inPeLurTgxYIMXmvWJLeE7eR7Fy6XDeF6vArhtI=;
 b=Wtvm1YrlQYeQB2SHtJa+HyB8AdrvrSqn/xb3Iesq39ZhGe/BB5eqogjRlpyJs5iP8J2pzA7I9
 3PdMXLLd6FaA9OORSwNJH0kAn/MNrc4SXMzR8zSMe8BHr8fmfVIiXy1
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The Milos SoC has a very similar tcsrcc block, only TCSR_UFS_CLKREF_EN
uses different regs, and both TCSR_USB2_CLKREF_EN and
TCSR_USB3_CLKREF_EN are not present.

Modify these resources at probe if we're probing for Milos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/tcsrcc-sm8650.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/tcsrcc-sm8650.c b/drivers/clk/qcom/tcsrcc-sm8650.c
index 11c7d6df48c7b39f661cc4c2df30387836d2ca60..3685dcde9a4bd5ebc62ae9c054e6b6a44d68d0c5 100644
--- a/drivers/clk/qcom/tcsrcc-sm8650.c
+++ b/drivers/clk/qcom/tcsrcc-sm8650.c
@@ -148,6 +148,7 @@ static const struct qcom_cc_desc tcsr_cc_sm8650_desc = {
 };
 
 static const struct of_device_id tcsr_cc_sm8650_match_table[] = {
+	{ .compatible = "qcom,milos-tcsr" },
 	{ .compatible = "qcom,sm8650-tcsr" },
 	{ }
 };
@@ -155,6 +156,13 @@ MODULE_DEVICE_TABLE(of, tcsr_cc_sm8650_match_table);
 
 static int tcsr_cc_sm8650_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,milos-tcsr")) {
+		tcsr_ufs_clkref_en.halt_reg = 0x31118;
+		tcsr_ufs_clkref_en.clkr.enable_reg = 0x31118;
+		tcsr_cc_sm8650_clocks[TCSR_USB2_CLKREF_EN] = NULL;
+		tcsr_cc_sm8650_clocks[TCSR_USB3_CLKREF_EN] = NULL;
+	}
+
 	return qcom_cc_probe(pdev, &tcsr_cc_sm8650_desc);
 }
 

-- 
2.50.0

