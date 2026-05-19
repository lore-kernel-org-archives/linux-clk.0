Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C732400E1A
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203617; cv=none; b=eo+6ZsSQkajwZbwjUD8RvqX1T3caTWZo5yr+sCuYY7i0DhK67ZUmf0EZshRIBbsTjkuV69NVNKLKbZZ4UVVTRoYXoVbncRvBnIjKjpK1foMIvl5TLg10TfZUQBCJvH6Vfel3s4S/Pm62XwZjLlD5z0mRzYlUChGnqh0NXD5cYWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203617; c=relaxed/simple;
	bh=PyMDXHTHmiBal63+huyGbhXhACUB3uDUE0n5xE6s7NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfNOy5sV/gz++7wFgj1Wn+Ud9g+9u5gEPJVuXgkGuhWDgj4iQ+BWN+Dp01+1j9LNKgliBlsf/sChzmnDxXrHzqqvwRcHR8NW1PJrn+lvUPwqSgcW3mE5UVrn0oPKxvH5WZBo51t94wD4az+z4JBdhfrUMcpjvTjwOs6E1d3cO8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVZYTxHz; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVZYTxHz"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-686af4e582aso3056521a12.0
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203614; x=1779808414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq7nQ1Lsb3vRwbjHSOrZ5dNJgO6+7CKIuI6JGLvOcQk=;
        b=MVZYTxHz3Q0zyXXumWZpCj46X60mfUg/RQkOL3fUPkBrDNQ8a3ZS9vBnnRVzMpdzVD
         C30RxwaC0+UvJddXJRruZsHTNogF5f/1NVTx99UQTXj0TpD3bAbCxJcKaiKG82Kq4Kj2
         WJJqzTzJTMPZrieRfNW9/Yl7SYQZk1DznQnVNb6L2Y1gSEGEMR1xUKb2cmZi1XnlIwSM
         mRVhlLAIH9q80ha5NigZpWzBrpEI/5MOPxuhBgVYuDT2oZDtI73FkTABFNn9JWPzflpG
         ZitOEkFeo07BwUR2gndPqzRJr4v5rl8gHqsSzIikfF4a4E0Q/Q0Nzsa9EBtyC9jqVfNg
         vS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203614; x=1779808414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xq7nQ1Lsb3vRwbjHSOrZ5dNJgO6+7CKIuI6JGLvOcQk=;
        b=M1S0eIFTXTtGAPNq+U6xrrhQAUHMexkU37UWLKAJ/kf5ASXi96l871o1XiyhFJ1tyH
         qSKN36tPrDO+umNXjXpuTptD36W58iV07y3+2nz3eZ4ljehztpP0VwTeOdlyIBDXMvZ0
         c+FvAMePZpEEKJK+vC/iJXNzAuZJhyBBM4q4IqPuOlcKTyOYbticsfK3AeL3ZMBBr/Hm
         v8wrciHdemBfK8cqrWjZVuFCbHhfbtJC8nY47ExmHLb7pUUGq6AfzTzbpd0P8/5gv8LA
         uMoBO01lxUe+xLhDLd4G+YRdCOidWml3iST2Kpvw42qt2iB7rfMmIHKP07CWp5Bk1rSm
         OGYw==
X-Forwarded-Encrypted: i=1; AFNElJ/XM3p6WDfkAFBTYnfpARqwWRhOupuIa0t9C6OYFKOKMPaicbd1WvS7NH7u+v8jay7Hl+Xe78cR5Hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaOSzGzwYPI1bk/k55n6+1X3gxmLlJtmDkw7jKUaIVBllXueSh
	6/Nbv+aGlLJjerK4yqiRwNAOcHNv52fLnx8V7ZmvlyD6Q7Z9/k57grTT
X-Gm-Gg: Acq92OF31TSLSZSypmURoYceuhW6W6/nPXY90mEA1Udv4z5Qe4kcq5OTThSm5CEc8KG
	V6O4toYVoJz0eerxbkc0SiQp6fkCAVhlKVHgM6GnQW7BLoBjb3iEyOTpJh19QvOVfG6Sl2b9X1y
	BYn5NLaDACmlc3/aK0MHKQ4+mc/na4Kpoi7AzCdUMxFlBOaAgh2RoeoJLHfOd0SzALC4GHDBcDz
	mGRAdrsscoP3LkjA3PHkn596UZTha48RRg/J816t+8yeuCMOI0wT9PC4m+Ts3cK/1+WouyE+Zn7
	5WmWARbOoVu9a+t+27XVnRaCvihc0VtopCAobg6zoHD83922lpyctntFIfpNhuOinlAmTJwa8Qz
	g6cQw5cfVMofzY04AEZpyCDpW2IF2qOQX/37+PtMUU8UD2IlqCKvYFbRuLnTwCLKeiDVKkGQIro
	ApQ7DUfMJTrSMWKLIQiYx72vapog==
X-Received: by 2002:a05:6402:40cf:b0:67d:bc41:334c with SMTP id 4fb4d7f45d1cf-683b40c5f7amr10086739a12.5.1779203613247;
        Tue, 19 May 2026 08:13:33 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:31 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:49 +0300
Subject: [PATCH v8 4/9] media: qcom: venus: add codec blacklist mechanism
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-4-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add decode and encode blacklist properties to allow disabling different
codecs per Venus device, instead of doing it per HFI version.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/hfi_parser.c | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index c1603eebd757..46705a666776 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -88,6 +88,8 @@ struct venus_resources {
 	const char **opp_pmdomain;
 	unsigned int opp_pmdomain_num;
 	unsigned int vcodec_num;
+	const u32 dec_codec_blacklist;
+	const u32 enc_codec_blacklist;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 92765f9c8873..8e762cf77968 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -206,11 +206,11 @@ static int parse_codecs(struct venus_core *core, void *data)
 	core->dec_codecs = codecs->dec_codecs;
 	core->enc_codecs = codecs->enc_codecs;
 
-	if (IS_V1(core)) {
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
-		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
-	}
+	if (core->res->dec_codec_blacklist)
+		core->dec_codecs &= ~core->res->dec_codec_blacklist;
+
+	if (core->res->enc_codec_blacklist)
+		core->enc_codecs &= ~core->res->enc_codec_blacklist;
 
 	return sizeof(*codecs);
 }

-- 
2.54.0

