Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6183B5F59
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707562; cv=none; b=Lxj7bOPDcgJeS/TbhsC8+Ya9SJjXUZSZCgf58lJpbxFs4U2cf18CEcAXWPM0ND0lhMsFpK8DT+jPm1qsaGtxhu1GFaRWwXxD5iXSQrLOAod14FSNRniYxUgRyWno4ebMLBpxqMx9ZxzQSoUsalqIXwAe4AaSC89fveG6MQ+AHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707562; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjEPgM6liDAg9Rg+1co/Okqas6gHCmlidKqBfTH+7PM7Bl6IcTHOC99q21yJUazv1e4HEizF6Vc8fPnzRw1l66qhr1AgqH0gtuk92mx84ngsTTXY3miAyIwmwFvuGfzCb5cbPRfpZcMQlsxIa7u2Yuzwcfmq+wctfs/n69U/Ai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUM4QVRs; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUM4QVRs"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64d5a7926cfso7249886d50.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707560; x=1779312360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=AUM4QVRswER92qtwHjyQVmWKTlEtgvxT6ShGu4rdeSHpmeGX6cBGhPwtBRS+u9m6AE
         otpzzCLfv933N15iuYZBTlKhJL8zMwVlFSqP2lbNeEbwDjYx4m51N82dFtxk3egp4+TD
         k03QJyEfKVAs7D/udCEJoqwtjQxMBIeB7IFe8DXXCfX26nfb85GIciN4jheLI742UlDv
         871ouuC1SgN4KCrgj3JKKtUAqBRlHZDG9ZpDpqbtbBnodxs5dlIwipEiVDal0BLzMp44
         IhID0j9Rw1LyzmkLfJHINa8xX7ghS6eAYhUkrRnXmMlNGJT6Wpv++BzyzmCkBl3PhGxS
         /VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707560; x=1779312360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=YveEODKAcHm3YgkaDSsKUjkYpxa2leUJOzywp1+VsSUjAnSvy527EnW4C3yjXbvGFm
         GCzB5uX04BLfev32mSj6xNJiv7q+Bm9HSHKPJnHvnpPS0wkPFL4V/Sj6W2aSZbifWMhd
         tIeqU2uDuUGzstzqLB3w/0WnnexjMt2rp80J/ABx3yt86yCn0eZWWtEvBIA9KM+DUosy
         w/d2GHjfqBP8uI+mt45PqY/yTM3/i+JWpuPCMYHrLM8fblks4Ef97IBftyRk2SQy8ImJ
         G8f08+xsVpymuTHWUb7j3si2AYn9oXK1fwKDQmjqzpUJo01pngnPrzuH4ezOoiamkipZ
         wZEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9osj4msGKSo3uoLw7PgY6l1ftmzmsc9Rj9x0JoYiHFD9C9QCCmWPXRt8CLdvoBqjw3lhHlhk8RIZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUz78Y1vIh65fQWTIh9RnZmJUQIT9sFYPYJxxCh3yhwsAJ2Kpy
	iv+7W/ek+HGsJ6QmDSLDtPdqbPaEkitieHOIcarLcYXvLCOW7/upvxeo
X-Gm-Gg: Acq92OE+17xQpUny5qGt+dW3MCwclfVLvgjV0i1oivO4jCEJzsH4hS5yA/NKtBIPH1k
	p4rTy/cCve8TnMLnNpw9GdEll+JTh9LZ/EY3y+iK8mOege0zh6aRCLxrLmbQUi1VCBVDKDC1weo
	euafSj4N9u/6eHaxdyni35zf+1pNOak+jLmITvlWwuLAWnhFNknzdzf1wWnXVUcXrbAeuCi18yy
	q2BS3EkGFW+gVycj+kF9H3JSHIopyBji6k7KTgsKjDSziAy6kfsO2yCosAfT+He5wk27ShupyLg
	4h3yzqqTtFwCD1SAURf3qCQy5SBHGxaoi8AexXzeu7RTFs3QWG+t9QTfJSFxy97rIgbrryqkFdl
	Irar5wClnjcwTskUF/CQUtexpBpXEIXj8Cu1OnZf7PS9kNeht+qFPgipfSFD3C1TWNQIDVRVXME
	qpIqiuQMQmlGKlHC/PvQPgrkpafQ==
X-Received: by 2002:a05:690c:ed3:b0:7c0:e1ab:87fb with SMTP id 00721157ae682-7c6da11a9e5mr45927147b3.12.1778707560454;
        Wed, 13 May 2026 14:26:00 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:00 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:32 +0300
Subject: [PATCH v7 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-3-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

