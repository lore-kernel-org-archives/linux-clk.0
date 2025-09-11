Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2C62417C6
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 17:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757610942; cv=none; b=gCVaIfU0OnJqOU9sPWidxRFFKwNwSrtbm9J6DIajBR5IRkpGNyp3enm3RpsJYgMMJeTWfZTTx0AVBttu5QvF6fvHnjiRm7VwBlr0uO8X3vGVyirh8/DXQmArpq4eGmDzqH4ue68DwZSt9FZ1UyvSqYPFJ/dg9tvfbrom/Wc/gZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757610942; c=relaxed/simple;
	bh=MW96MT2H5e5odG8AsWjgHCe+BWBDJHJDIscXEc3BAJo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IsTZjGmhsEhdI2jkK5m7fvlA43rUxYjcPDynFkvVVzWisCF0hqeU6yhnsYkaKnf0tEPslFysPC/ILxK4E5e2RTBht1MFbGIQ7/8BrNqRZY/r4unUKI25sJDZshK7f6lkzeUagn6iIlmzfWLKxsRL6v2HbPj/RQj59HJsqE9wrMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCgDyLnk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCgDyLnk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45decc9e83dso6002215e9.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757610939; x=1758215739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlBu2NprIg2+aIhadTPHpgKffn2YpAgdyJg8kJsiv00=;
        b=RCgDyLnkxm9gXTQV/vazW9m9XgBISOx35hfWYIQZ/SoQvDaTdDtEVMaGzM4UTVfgO2
         XXydGuMlPGlt5qE6iYMeEcvazJfFxgUhPOOAjorDBxMSEIrrwyNAOqECGDd8e1NSosfE
         zNt061KCNbdE6OjcXKzP979fAw3HaySEyLx3mPzBkGD+cdV+M4+tUKaxTudeWWr95eCK
         q2RMBLGn3aiUt739yu1v32Z/pZcQ5pyWFPFqzrBcskz8Ni1tESaCIl4j/K6pBN6c2zCS
         eA90K8CuK0fgn75ERW0fHTR4Ha22z6iJDa5GusmY30U80RFsyeIrLLy15SwtjKtJrK4f
         mHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757610939; x=1758215739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlBu2NprIg2+aIhadTPHpgKffn2YpAgdyJg8kJsiv00=;
        b=paePfZARAIR+XoDIXQZg9+BHs6GcNJewR/q9ZecXtKYsbM6e6l3eIRHCD3fnKq2o0k
         iAIgs/AFnn5bRONfaiHFz+5/uo7qPVMXrtTkXV3/WtHlpEpiGSLEhY0kRMaBugk6Cigz
         JbuXAw/DCpLX9Ic0dIjX7dx/8rM9x70pTzc85gaOcMWhVSuAWiETLDeoOA0mQcEyYsaC
         N75mA9bT5BZ0LTJpmoY1Pxdj+X4smN7yrOozlE69+99AAgN1hnzv2ugRWVEcFS/ed91f
         RGPTLUwBmB6nmQWtw1Ibp6YvpPtBRIB6eSTCF3Ek95V84SINQqEwZ7qOeHjp68DJfOUv
         jv3A==
X-Forwarded-Encrypted: i=1; AJvYcCW2DPDMveVxQuE7FKOIxHR8lJnOny3hvaW2WdH5gUqze1Qhowa9EoL0HLYrhyA3tj2HCKsPEn6YvHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzigHGASGiAEyxoAuQ5FI12guCyvyFp9mVd64UuNhx0D8Ff23D
	Sp2oIyWkMbpkGQe27OPlSZFe0Ch7LzYbnvJWbEiCYRUoy924deYd4lWj
X-Gm-Gg: ASbGnct4Ql3ajmNKzFbF/ZmJdSgLFq+KK6q3XjIrPviWu1hDcuz/Oo3AaZ0+AK1zDEG
	DidKHKFtv8FBM7FYRBmy/fS8LrGxweSfFPXBxY/w26KHD4K9DvxwHh7p2/SbvSixcTYUM+x2aPN
	LlD6gH6Q12XthAAP4vr/2UZw1pV56YL7ZGT8O9NG9g47GbOwEJuZj2TDkEDqtwtwmIU7tZTz7x3
	so+flKrXlpO/+vpkc3sXdnu5mfZOjHolysnu4UxBUjamWJIF4H284hzTMeALzOX/+vxIl6wbcSV
	8z/yW69F79OJVoJvl5aP4mkjZUd+A+Z+zqlPmwk7PiVC4hfbMfDnj8RWpCGbnec/Kbr/cvRZH6Y
	c7kS7F/DK//6LL0Wpk86f7LDV2vRnqWPV55q0sEvaJV4Y7izsHb4sEQngyru5F0hztDyarn6J9E
	9hP7FC0l5mdCcp5dfQ5frniZY5
X-Google-Smtp-Source: AGHT+IFyNITYXanMUiTOVy2Osl5V4I64mGYalEHfEOcAOQH9B7h6enLV0/I+HA9A714OXMrpa16Evg==
X-Received: by 2002:a7b:c4d0:0:b0:45c:b601:660a with SMTP id 5b1f17b1804b1-45f211f2fb3mr1627565e9.23.1757610938657;
        Thu, 11 Sep 2025 10:15:38 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037c3ce5sm30198205e9.16.2025.09.11.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 10:15:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: Re: [PATCH] clk: tegra: Remove redundant semicolons
Date: Thu, 11 Sep 2025 19:15:32 +0200
Message-ID: <175761090509.3229177.9207716245913935287.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250813094003.552308-1-liaoyuanhong@vivo.com>
References: <20250813094003.552308-1-liaoyuanhong@vivo.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 13 Aug 2025 17:40:03 +0800, Liao Yuanhong wrote:
> Remove unnecessary semicolons.
> 
> 

Applied, thanks!

[1/1] clk: tegra: Remove redundant semicolons
      commit: 8ec061e72f15da80df10d4cf29777556992074e1

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
