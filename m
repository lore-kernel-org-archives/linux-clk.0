Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117AD1C16
	for <linux-clk@vger.kernel.org>; Sat,  2 Mar 2024 00:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709340743; cv=none; b=Ivb0RwRqJbbLFi0J7iwI5sSS9gDQVsT/wZs+rFSn9I7O3EMI598/OgjWutf7b9XCuo3c61TcMpZI1LDCdnosh9S0bdFLw2dv6EKUFRPJW5SLTDHbmMA2zVh2eoV9VuDfA/R+P7MLhUYUyngxW/7AxFsZEsb1i16+jzmSUSQEJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709340743; c=relaxed/simple;
	bh=i9zNt6rOlk75HZazBVwuQFbrGUUh1ujpF0qjhh1iKXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXZAgvtfWJh6KJb9dtLk16A1dW20ch+2lehJs8nRIePmSiOCJ/V9llMUzufZ11uvBMWmvlKhYSDZjXNkoQsp4QG04x0HpnC7OYvxdGHIcQ+FVYXyNEvZEJX95Wm/3b97XYomz8sY+31qYkBxSGIvfpWwvILWoCtJyXyUYtsm5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ciwdgtcx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ciwdgtcx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412d29057a9so726355e9.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Mar 2024 16:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709340740; x=1709945540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/abXWgtHmlIb9XxgX5gbRZA6M3LUdmvdJ04zpHwkRbw=;
        b=Ciwdgtcxa/fSIwfjDv5PEpnA12SP3Ng9piagaR7l7Ovt6t65i3JcZOvJqi/zFXd29D
         b71KOEy3u2LsjJFBCCJRlM8pH7oe6DSv3KW68ycHfPxaIenn2tq3MBfDGeefdR9SFfhx
         tw3QZtzDdma3CBg6Ucj8l3+a/H7jDXEABjR2BUZ2fsc+dNoZmO4+XsgPQNKobxKKh9ld
         4NCIJfHOTrlvqKdTengK9/okDZjvdrSwhALXHhvgiZdYTVYK4ESkbh6VPxa91ufNVi/+
         p1jQg6C9VVudSqxgOxZYa5ZTiTR2uTaeyFdA8/8PzZ47iqyy4G4vRZM1o2msMKo2eRyy
         kboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709340740; x=1709945540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/abXWgtHmlIb9XxgX5gbRZA6M3LUdmvdJ04zpHwkRbw=;
        b=kNr9sszCTOz1zPnaNsnniQFr6HpuI4eECcraYnxxWgs6zBZM258IQUXT08pTvEtvbZ
         1/5Zmi8vgeBd42z/FlPjCgenpTdMnHL9GMXQX7hcuBg7DiJgEKyWze/1NNbbtdo+bqir
         MTdBNKdijgap2J42MKSD+pAs2qqYRDp7HOuQiWHcVGPffBXkHDOl/DYKRJdcWsCp0HeB
         mYI5qrTvamY3cXwnQ/t+hGqU+SyZ00IgWDjVeTR9ESDxvbiKUm0OV8jxeXeV43xc9HO1
         t/J7vDtHU1EVa3iii2vNiNImfw0Aux6zeFEB4iPh5MiavVvHE9S6EOrLtwL7g+4OmDVV
         Cu2g==
X-Gm-Message-State: AOJu0YwuF6XZiof1b8dnq/WL3VHDDPcelARdMaJQJiOyPz4qiTEj2DqK
	0F8FbFAFLMps0oCot1CisUqg4K7mzjknGybZRolUm9LYq57OV40aj/TEz2w9dtvj0dRBCoYw0v1
	g
X-Google-Smtp-Source: AGHT+IFf6kIIxmFIowOq9kVezM+FJdAj6mvoHaDA7SDas70k/1wBH2ROYjcRSmBpd7FsWaBYTtjDew==
X-Received: by 2002:a05:600c:4448:b0:412:b0d3:49d9 with SMTP id v8-20020a05600c444800b00412b0d349d9mr3246722wmn.9.1709340739907;
        Fri, 01 Mar 2024 16:52:19 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id f15-20020adffccf000000b0033dedd63382sm5865501wrs.101.2024.03.01.16.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 16:52:19 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 02 Mar 2024 00:52:14 +0000
Subject: [PATCH 1/2] clk: Fix clk_core_get NULL dereference
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240302-linux-next-24-03-01-simple-clock-fixes-v1-1-25f348a5982b@linaro.org>
References: <20240302-linux-next-24-03-01-simple-clock-fixes-v1-0-25f348a5982b@linaro.org>
In-Reply-To: <20240302-linux-next-24-03-01-simple-clock-fixes-v1-0-25f348a5982b@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14-dev

It is possible for clk_core_get to dereference a NULL in the following
sequence:

clk_core_get()
    of_clk_get_hw_from_clkspec()
        __of_clk_get_hw_from_provider()
            __clk_get_hw()

__clk_get_hw() can return NULL which is dereferenced by clk_core_get() at
hw->core.

Prior to commit dde4eff47c82 ("clk: Look for parents with clkdev based
clk_lookups") the check IS_ERR_OR_NULL() was performed which would have
caught the NULL.

Reading the description of this function it talks about returning NULL but
that cannot be so at the moment.

Update the function to check for hw before dereferencing it and return NULL
if hw is NULL.

Fixes: dde4eff47c82 ("clk: Look for parents with clkdev based clk_lookups")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a3bc7fb90d0f..25371c91a58f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -418,6 +418,9 @@ static struct clk_core *clk_core_get(struct clk_core *core, u8 p_index)
 	if (IS_ERR(hw))
 		return ERR_CAST(hw);
 
+	if (!hw)
+		return NULL;
+
 	return hw->core;
 }
 

-- 
2.43.0

