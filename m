Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394974;
	b=rAKwlRshC7juF9BjpPBMRFceqTjy2CUr7tE2NY2rvxI219ImhH47wDPbZu2cEayPraKR
	 0uScSuTF4DV/JpQr2bxpE/7bivBRArVZUEoYabOWoemsXAkNsIikgGznx5NFvYGWlPU8T
	 WNbnxm9T+YN7M06Ojk1xcOOmRwz0ofeJvhJDcoZST3f2o8huPpWJs9oM6VZxpb/y+Jh0O
	 6+VdEyWBxvpJVPhH3JGQKGDcvxavA9T9Mb5y1AFXZS7xl8legE4feDjnID4CBXKAgivvD
	 JlJJYFj8ljpjz/NFYf17cFG5j2YMqweF8NNkN56OogN0ptS5rskMyD3Woi/Tuvzv70g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Mailer:MIME-Version:From:To:Cc:Date:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
	b=l2rXIip5EEAZ8Ib5rbGlT8/JVGgurY5eKrXczXSgt5cMA3GQ/JQJ3Xrt5PIyi0QDoiOg
	 52C0RbvFthr3Uz47vGmc00zwOEeyikAn9R7uDKBnDM8l9Ix0jfGJ4+jgZKBOPUQRulr4T
	 AfIfjwOXpjA7Xu6OmUZg8CmWUlcHQasFB0JnIPVfRpCzkH0RhWR8FV97FYa7N2ZWI1XM5
	 lL7ZlISQGUpzb6veXtMTCdPFtLL07aBvQAlq7wCUpjHkhmiv7RqlATRwC10shBqUZUU2p
	 NHgzPaRAf62l/5hrqpgovSnIuht3Ut628hMG+bB938LYCRkWmt1CZzRmRY15eJ4RdmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L/J7sxDT";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F9D606A32E
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 11:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F9D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/J7sxDT
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37198ed3727so3769999eec.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 03:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394973; x=1794999773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
        b=L/J7sxDT/XCJufsPd4aEDhSnaTLlDVWoiL529BZDSumU/aQ/mYA3iXEkNrpXVwPBoU
         q50f97GVB0vrlQkxz+YQ3McVBXk6IUksdPIimKZVW3fbiVQmmJCxzwvMavzaQ82tjaQa
         pdHG373MMWyh2wHSfUN9lJU3hWzM2BJUFG4Jd07p42866K55AYB/qdE/m3Hcye8CZ2dr
         3CWbGnOzR9Kv/vfIVVuW5wqJrVkeXOYFDMr/ZcAOyQKBW73W4vdLW8rIZhlLRfilr4DM
         OcyiCfJjfMgALs2pSDPWTCnawgN9aUugAx1doh53H0aliWkfvx2E0m/9O8Y+w3WEVUSQ
         KlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394973; x=1794999773;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6DQ1y9vg8ORZJ/bwoXjkvQtXiUjN7fzHpLiBzLwJqSs=;
        b=AzPLAS1o2G7Xmll7OTd4by7Opt4c507NPNcVBGfbY8mbk7WH2TLyZ0cO2orn5KsRBL
         WGbZyt3AAi55svvOzo+M/YOc+6uBZV02y2eMhZOX9UVflJD6GFabK+lBBaU86FJDqDdV
         hCZQedgBy7lm+Z66bz+ePJpi4qWn7zWheM1qJzG3gWLacDqv+xOPilgddfQMsh7jT3qg
         Xedgce6wySJ4YgAHDMrII5oStobX/QA8ZnbLjWrqSLorV+eZDLANL8/LW/2X9qM3tmSE
         uBfLMbW6dAD9Lkdrpcj9FIzb7kxiNET5am20Bpvio0DwE+LcIRVT6lsa8IhYXxg72xUR
         J1Zg==
X-Forwarded-Encrypted: i=1; AL+hErH7FVyCjdGdqdZvoavPp+lACVqLZHUewNQ2Ke8CyYlGSv1um29oe4ICSddp8ZGUJsw8uMnE/L1UTUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SuuAesvrB6FEuVl8ZdH42H0Ess33s5Oe/wvI3Hs8vSbHWeLh7
	MS8bqFo95px0q8tbrsebUcHI0gbplubJskhTWFORr+1PXZGxJhDloJEv
X-Gm-Gg: AYBFou07MKcjhNC9JdT3C3Ojh+KkQ0htc4tzzBUracbFoMrtMKoFOtP/XvRwL5obpaf
	NaceKDmiNDb2EzXR5AdfWUxgX90+EVR84M4M5y8ThjQCbQ+FnrVYYqSnXa24QRLVj2EWTN3kacW
	niTkVWxXDDF7Zszb8j7xhzZR4QBz+UMK1wd/G2v65voE5FG5yBmt5u//zPXnqbhWYixvXkiUVFv
	MGVjSMDbUuD0mILfKBA9IG2RuuRdl8+dFM2q3CUruy2zS/zsfTIcg+JSn9jo+082yOBCoDCxB4/
	ELyrHRJixe4a58OLj9611ckTpfwbHRRuZXqkfpwvAprFtP+3OJRg4Fm0+e3jk+5nOqUEq/SepW5
	HMTRvWh+/nn5NEnFEDumNCsl5aTXEN6v5yqT5VAu9zZsFTxAgk2WBl23c4E4ywLEET6tcoTFXs7
	64rZhAvGGbhUULKKWtwFw502PAN2Nq5fpHUeKuWoZFipGevxRl+JTtGVHDtwvqK9yxVF5a2gw6J
	qZ7vc3GPqzxg+O889gU0DLw8h1a6S/hHkxjJSJHrz2F1fr6drFhB+q/hUqYQSNnkhfzEjSAKAcJ
	GlY6GoYAUh0LBBllmfourLdApNuwmtiUuYu3u5rV0IE28TFinciTxkHuubUPEd7jJzY8G3Zi6Qc
	t/Reh6oJSPe9Y68OmYY1YdaQBZQPA6QVH18Si
X-Received: by 2002:a05:7301:e22:b0:36a:37:1404 with SMTP id 5a478bee46e88-37686d2fcd4mr3499154eec.13.1794394972545;
        Wed, 11 Nov 2026 03:02:52 -0800 (PST)
Received: from manush ([2406:7400:94:5368:19d0:c01f:d33b:214b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm30729052eec.23.2026.11.11.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:02:52 -0800 (PST)
Message-ID: <6af44b5c.67914289.fe7ab.6559@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, sboyd@kernel.org,
 mturquette@baylibre.com
Cc: s.hauer@pengutronix.de, Frank.Li@nxp.com, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: 11 Nov 2026 16:32:50 +0530
Subject: [PATCH] clk: imx: clk-imx95-blk-ctl: fix error unwinding in probe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In imx95_bc_probe(), bc->clk_apb is enabled via clk_prepare_enabl=
e().=0D=0AHowever, if subsequent operations fail:=0D=0A1. When !b=
c->pdata, devm_of_platform_populate() failure returns directly=0D=0A=
   without disabling bc->clk_apb.=0D=0A2. When clk_hw_data alloca=
tion fails, probe returns -ENOMEM directly=0D=0A   without disabl=
ing bc->clk_apb.=0D=0A3. The return values of devm_pm_runtime_ena=
ble() and=0D=0A   pm_runtime_resume_and_get() are ignored, potent=
ially proceeding with=0D=0A   an unresumed device or invalid runt=
ime PM state.=0D=0A4. If clock registration, of_clk_add_hw_provid=
er(), or child=0D=0A   devm_of_platform_populate() fails, executi=
on jumps to cleanup:,=0D=0A   which unregisters registered clocks=
 but fails to drop the runtime PM=0D=0A   reference acquired by p=
m_runtime_resume_and_get() and fails to call=0D=0A   clk_disable_=
unprepare(bc->clk_apb).=0D=0A=0D=0AFix these issues by:=0D=0A- Ha=
ndling devm_of_platform_populate() failure on !bc->pdata by jumpi=
ng=0D=0A  to err_clk_disable.=0D=0A- Jumping to err_clk_disable i=
f clk_hw_data allocation fails.=0D=0A- Checking the return values=
 of devm_pm_runtime_enable() and=0D=0A  pm_runtime_resume_and_get=
() and jumping to err_clk_disable on error.=0D=0A- Calling pm_run=
time_put_sync() in cleanup: if runtime PM is enabled.=0D=0A- Addi=
ng err_clk_disable to call clk_disable_unprepare(bc->clk_apb).=0D=0A=
=0D=0AFixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driv=
er")=0D=0AFixes: b08217a25721 ("clk: imx95-blk-ctl: Fix synchrono=
us abort")=0D=0ASigned-off-by: Manush Prajwal <manushprajwal555@g=
mail.com>=0D=0A---=0D=0A drivers/clk/imx/clk-imx95-blk-ctl.c | 30=
 +++++++++++++++++++++++------=0D=0A 1 file changed, 24 insertion=
s(+), 6 deletions(-)=0D=0A=0D=0Adiff --git a/drivers/clk/imx/clk-=
imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c=0D=0Aindex =
bc6957299..ad386a48e 100644=0D=0A--- a/drivers/clk/imx/clk-imx95-=
blk-ctl.c=0D=0A+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c=0D=0A@@ =
-394,17 +394,29 @@ static int imx95_bc_probe(struct platform_devi=
ce *pdev)=0D=0A 	}=0D=0A=0D=0A 	bc->pdata =3D of_device_get_match=
_data(dev);=0D=0A-	if (!bc->pdata)=0D=0A-		return devm_of_platfor=
m_populate(dev);=0D=0A+	if (!bc->pdata) {=0D=0A+		ret =3D devm_of=
_platform_populate(dev);=0D=0A+		if (ret)=0D=0A+			goto err_clk_d=
isable;=0D=0A+=0D=0A+		return 0;=0D=0A+	}=0D=0A=0D=0A 	clk_hw_dat=
a =3D devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc->pdata->=
num_clks),=0D=0A 				   GFP_KERNEL);=0D=0A-	if (!clk_hw_data)=0D=0A=
-		return -ENOMEM;=0D=0A+	if (!clk_hw_data) {=0D=0A+		ret =3D -EN=
OMEM;=0D=0A+		goto err_clk_disable;=0D=0A+	}=0D=0A=0D=0A 	if (bc-=
>pdata->rpm_enabled) {=0D=0A-		devm_pm_runtime_enable(&pdev->dev)=
;=0D=0A-		pm_runtime_resume_and_get(&pdev->dev);=0D=0A+		ret =3D =
devm_pm_runtime_enable(&pdev->dev);=0D=0A+		if (ret)=0D=0A+			got=
o err_clk_disable;=0D=0A+=0D=0A+		ret =3D pm_runtime_resume_and_g=
et(&pdev->dev);=0D=0A+		if (ret)=0D=0A+			goto err_clk_disable;=0D=0A=
 	}=0D=0A=0D=0A 	clk_hw_data->num =3D bc->pdata->num_clks;=0D=0A@=
@ -462,6 +474,12 @@ static int imx95_bc_probe(struct platform_dev=
ice *pdev)=0D=0A 		clk_hw_unregister(hws[i]);=0D=0A 	}=0D=0A=0D=0A=
+	if (pm_runtime_enabled(bc->dev))=0D=0A+		pm_runtime_put_sync(&p=
dev->dev);=0D=0A+=0D=0A+err_clk_disable:=0D=0A+	clk_disable_unpre=
pare(bc->clk_apb);=0D=0A+=0D=0A 	return ret;=0D=0A }=0D=0A=0D=0A-=
- =0D=0A2.46.2.windows.1

