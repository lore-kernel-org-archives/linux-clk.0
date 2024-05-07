Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0973D0BD
	for <linux-clk@vger.kernel.org>; Tue,  7 May 2024 07:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715066465; cv=none; b=e/0nO38rce73pPhpeFU5ER/wBWNbng++If+Bjd6EVzRL3kHryZRhQikFaN/CYbmcG9OXIrL2pfZDMHhv+h4pI9dwQVHYoR+MIM5D3TeKFACmbjZq5eFcNiCYGfRg5RGdWs8zjypNX0W+N32Qid9PI7jECIb2YypWOdc/7MxYjps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715066465; c=relaxed/simple;
	bh=GipwqvypiOLvwU6EeG+vLAUPgeUBGeq105ZDmCvbcis=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BLAf1wz26A2HpEiUEwUibuyfmZsRdp8sOr8s/HDJEqnZvNFZrMdDa0KeqKKWy7Q/27mKMtRYW5EkoJyvydGxSxpL42oM48pHlr3YePnmruiDiGMzNPgMBUr3AYTskp+OgDIH4njNFeTFg506H/3RZ95Ljbu2Pc8Ou8ScFbQaEnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hw1YIoNl; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hw1YIoNl"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4df439e1056so472021e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 07 May 2024 00:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715066463; x=1715671263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GjboetY7EGGtwn+rjcmmRLaaZ+xjrYO5U+LuNkUiwoE=;
        b=hw1YIoNl5MVlYWSOY4rJf7cd8KR2Sy8RfyUhLbwFrAIhBQRRmlQUf5k+5+Cb+F/IQ/
         DDtoz4fnqVhatcClk6A/uQzA18Wz473Ef6AIuT4XZ6gl0RfLA5HoElrLB6BVM5G+1ZWK
         8orqZRPF3vu8uiv3izu7sfdE3VyTxomuKCKiRIb5ZPIJWzzk+e0DoO6FF1ASJR4HPdP2
         Mu7r7kEj1GbLve6ztS+CluG1OBfJLEnTOw2PF01JHlzwY6nGZjHfw1DEcu3akBh5d08R
         wjjOPzLcra4lIXZOxeODpN/AjgWV6h3PuWtnLxPwaDJU1xmIFuSR4uhv1c3R2TrMf7iw
         1VlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715066463; x=1715671263;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjboetY7EGGtwn+rjcmmRLaaZ+xjrYO5U+LuNkUiwoE=;
        b=X8GN/BNTQ6iw7wssD27qYG3YlwcO/17t3Ojhse0dNzgkogyQJWdsWG+wBMuyMoPMju
         BHpdTjyELucboPXdCrQIaiqR/SumROCGf6ga+Fa9mIQSchPteJquomUWoNC3PVbxuvvz
         pSfN3RgsJMVAmiib8Ql7Z64ayzK1mCyS7bCxThgy7wIyXCTrnfSTMSveOWE50JWLMxfJ
         YEulzzedNxokBYzcC2zLWfya1wLDmtidi3DCFcMpsf1Xu2IX4fIHkWN0QQnFv6KOHNZL
         jp5ZcIt7Wh1MSZB06e8mUgEeD5/0bq11NwlHz0PGF/0fIk2L2KcpboNkL3gPOb6xAjvN
         t8bA==
X-Forwarded-Encrypted: i=1; AJvYcCWvPriJc6EwP8UcNc1T0tGzTWg5ThhNh7b20mfHRmaxmSUkfi7wpC+KcApumEiUrvsQ8+2eSWBygaQYLVn31Aio+nDVFTLMo2HH
X-Gm-Message-State: AOJu0YxCDIig3t4q1q5nOkQbd1vbX284kYI541fbwmUeK7kox5le1H4J
	s7c11GLNF+yNbSynWCaSnEXM0Brih40Y7CBNFnZoM/EaUbMt9iLiLTKnC0+HhGRF+cmi+9nE/Y6
	S1K9bVn5qDMtr+AKZcdaKdR9ES/RA1Rfh5svZQw==
X-Google-Smtp-Source: AGHT+IETDU5JT1DtqMGEfiFivAePnxXKVoMG/w3zhoz5NnmwO5ZJXRWGQnDhxQreZSmBun2BZZydbuoxybM7jF6wIJ4=
X-Received: by 2002:a05:6122:88a:b0:4db:1b9d:c70a with SMTP id
 10-20020a056122088a00b004db1b9dc70amr12185575vkf.0.1715066462784; Tue, 07 May
 2024 00:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 7 May 2024 12:50:51 +0530
Message-ID: <CA+G9fYuZd_ur56H8fwDSvUywopvn_b7ogprGkjEatQ7EPTLwYQ@mail.gmail.com>
Subject: re: clkdev: report over-sized strings when creating clkdev entries
To: open list <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

The WinLink E850-96 board boot failed with Linux next-20240506 but there
is no kernel crash log on the serial [1].

Anders bisection results pointing to this commit,
# first bad commit:
  [4d11c62ca8d77cb1f79054844b598e0f4e92dabe]
  clkdev: report over-sized strings when creating clkdev entrie

After reverting the above patch the boot test passed [2].

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
[1] - https://lkft.validation.linaro.org/scheduler/job/7546260
[2] - https://lkft.validation.linaro.org/scheduler/job/7548064

Failed information:
    - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240506/testrun/23814147/suite/boot/test/gcc-13-lkftconfig/details/
    - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240506/testrun/23815165/suite/boot/test/gcc-13-lkftconfig/history/

--
Linaro LKFT
https://lkft.linaro.org
