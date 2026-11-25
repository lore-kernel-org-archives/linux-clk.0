Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642487;
	b=RG1nIw6doRuu2RbXdaQF0Qe2doO1I0r/cVcNjiFgOymDO1Xeirr0qH9NQca08M0wUVTh
	 S5SwLxUYmY3qAjgQNkwLCm+cvIAqDGcs+kLafDWsw/E52ulMD0RcKARBfVVrWNYheOF8/
	 bDRulNhk6jAE/us1I9SGOgt+om2iNnKzkw6im9YpUEcLANdPFsAGRZuJMsp3kwFc+8Iv/
	 T18vrn1oxeg3VBBVN/leFlcjHeJSK6vC9oli8LHFjHdWxxkYfw0BCp3KCRCypqplcrsMo
	 GThxYTgwvs9UaFmJW0lIlWCDzFBy09qWTk1cET9yomLa9rTyB0i435IHklwvn0uz/Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jXX3gkFCOkNPcapqV5zy6fgymKr5RIqiGnmKRbO39Qw=;
	b=0THPu1FMFU2HQWIILI6oOt6GJebVQXtVHPL8sc4vlg4ypsAG32kdnWz3BobNHgNJQ2Yb
	 QG5GzDfQTDEK6aLk4BoCyop/MIygzMpbKzgZiyLC+i5BIReIUu8nPGDdpp736xgjl/aNx
	 2X3EvgXApeilqR2R5J1RdtOyLRLrghwcaz/sNTp9raL1uYMYwY2jhcnum6SoUElMqDZ17
	 JMRpEticv4ashEukHSlJ1Dfb7G+iq8sr3LcV3dlxR0ExCMCLBh7O2X2p6Fkdsf9oXeLIW
	 lQSj4Schk/j49RyAmmSEOOIV/SDwUK2fahBIaFHTh8fGP5hMSB54po9ixHxTLnG0wHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qeVdXljI;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F2A606A31E
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 21:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F2A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qeVdXljI
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c1ad0d0b72so581611e87.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795642485; x=1796247285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXX3gkFCOkNPcapqV5zy6fgymKr5RIqiGnmKRbO39Qw=;
        b=qeVdXljIB+1M8aTtHy3OLelc/hYOQZ7dY7OO8jm9OSfqgeIrgsoeVwA7mLsGob950/
         7PJ/flx7gIa1tw6uXT+54jxxH7lQFMUGyPJ3/4hSmnRDKBOAIWFQ7oMirVfVvL9uz6Az
         5nZ9MVe/ZSss3DbHP9u2azLphlAga3cNjF08WNYLxCLSS6WyAcH0+QqLBE/DkAWNV+LS
         eWcJ2C896XVe468vgjb3l5sFAftNBZw8Mq1/WaE7CljFopuu5LMltL4uwKfTFdWo5C5q
         tG/llhKZducvRh6J27ba9Vx6xmjgCB4pPvfDQPJjRSD0+Y6x5S8UEPLcU+0srxLw1FKJ
         aiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795642485; x=1796247285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXX3gkFCOkNPcapqV5zy6fgymKr5RIqiGnmKRbO39Qw=;
        b=WcOaPbuhv+ZdGf2DSpuGRsADLsdJAG95FLrFP+Gl7xX5bfyxHJTVdtXlK2THtPV+Pn
         pH4ApUPyMJzbRw0MNyyOihdoAquEWyFTLBLmdGICrRKACKwDOq2CypOPWTEc5SAw+MOr
         HjKem5+YuFloG/tv3A/qUu2Tatgo8oYLYEglEoB0qtbs2oFjc64nIHDtJYVum6xrlvLV
         GkwPjreX3GuuTnVk0Ej7VZxTNtgV0XPsaEY314R9s3lBNAWPm5KmT6TyHFY/wfU8mYYd
         kOq45u7u/3kwQ2R0UYIQsX+goXxded95WFcyT32Ts05Xjc2FESh1Ldukx3i4eYXv/+2d
         QiWQ==
X-Forwarded-Encrypted: i=1; AL+hErF4VRZ2153LL4A57eyGW2di0u6yPbBm09DQvkUuxGwqSE/LAyGms16TqoOMomolFLZYRdJeSBKAZ9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y5jt/XqSKdaRIcas7ZL2GqvTSrzt9Eyrk4ReyA9JaXd1OF46X
	hrzTaTTiXnKyDIa3dluKdvCkB+B29oyrhMcy/gwzMtXfxxOSle+lr6hWqphYYNrwPro=
X-Gm-Gg: AZFdTZfp2FEsGRkyONjnJvyerIFuBYIDS1M7jtpn56GYG4b7q7dCemx4nt3YH5kcXpt
	8yXNrTPvkzlmXVH0/qjY+8gZ/azHf1nukdD9C7R+zvQZ94YaZLNezJEK2jQ6wny8pplPCQPOYFH
	hnxvLSPHpwJdpwSnWEGp9ICBisROUpMYRZU/02gf3HZ2ieVikrRxQKLb0bQazCM/cbKJiHRTeOs
	Et29zHLO5/hO5JxRraWI6QyGcS9hkNZUrdK2Noy2OHPwDhkk8sRI8CR9FbqniET7JddsG6eCdY4
	UAJvw73pm68Q/SkGIIKyK7QHtE4pau01Zq2AyONeKYiOJ/wk8aBUIu2bKvkeaoLu/+SLC4z9NK6
	p/MojyiXAp/Mj+4cxGvz1L2UYIPXCYzWnR3ZMIbphQUg+vDhe1EkZ8ePpFB6NoULoBcCjYUIKqN
	JXTkewl/Hcsog4aG0ll84HVzzH+5p17rJH3zdxJrGDr97vhFZ/+GkHBq64+3uwRBwjQTMPKCFl3
	EAFPHO0L0hY3pbNnK1COmfxXiOHaR87o77aaJJPE12Uay8RabprmF/pifl7sJIgt6y997r1v+3D
	Hc6PUYD1K/18nxY/+WKtwu6eb7znxCC5Q5xzOyMdz3qdQCMWfOWQ8QjnNJj3Lef0FFZS3g==
X-Received: by 2002:a05:6512:6719:b0:5bf:ba43:fa67 with SMTP id 2adb3069b0e04-5c1bc935c91mr5378563e87.6.1795642485238;
        Wed, 25 Nov 2026 13:34:45 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf3338fsm4845422e87.3.2026.11.25.13.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:34:44 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even post divider table
Date: Wed, 25 Nov 2026 23:34:33 +0200
Message-ID: <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPLL0 even output post divider table is not terminated by an empty
entry, the table is passed to divider_determine_rate(), and the generic
clock divider helpers iterate over a table until they find an entry with
a zero divider, thus they may read past the end of the array.

Add the missing sentinel to the table to fix the issue.

Fixes: 1c9efb0bc040 ("clk: qcom: Add QDU1000 and QRU1000 GCC support")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gcc-qdu1000.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 4dfc67280611..6f44f4cc9968 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -65,7 +65,8 @@ static struct clk_alpha_pll gcc_gpll0 = {
 };
 
 static const struct clk_div_table post_div_table_gcc_gpll0_out_even[] = {
-	{ 0x1, 2 }
+	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv gcc_gpll0_out_even = {
-- 
2.53.0

