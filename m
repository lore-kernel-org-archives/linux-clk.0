Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE13D646A
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151260; cv=pass; b=hmet+ASv5P5GFebHHH1Viud+7gNFBd2OH2qPHaaFsCzYdIlfYAbGpurtGMqYIlFN8kgb/VZ7qJ3QKuggFZYGn+um+gMKeafu/29pvkSEV7cGn8vkYE3dw2Y1q42hBSbSn9bvABbk3heP62KdVMAE/UUiK5U127m4XdJEF3KuoIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151260; c=relaxed/simple;
	bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDKpuroH3pHGb/Z7sS3T4GVR7+p6+KnbG5OSwEiZN5vVSMT5a3SnWNZnaA9wiEuxIhmuibxrn2qGhBPv2sUswUe++lAy5d9TbxwIyDksmZC7aNznWOAxTH2BaTIXEezx1FXn0TVioZF9BZUmkS6PtKIZvbzgZ/dz9NRU/xgciL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=If+aXJer; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="If+aXJer"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso1140503a12.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 03:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778151248; cv=none;
        d=google.com; s=arc-20240605;
        b=RDKmyekzIp/Iq5VYtyMsVHXhuDDkfqI3V5+2j0y5wEkR+e0ROc/Y6ZzxoVBDgNLDIv
         c2qmkz6ReZ9ATyr9gAwRJQ1z0gRJWZBuSKHuYf613BXXhs9CFisxiMfctTF6ZruDh8dM
         xGcYR40Pb6DH/Nati8cC5hYO4EDe1VGpqNv3Zi0S2GyFvm2ivQci7b477I2aVefvroFH
         wtuNGYQwJlC4TtNf03YTxns0PWIYiUGCZ1xbjif0tlbvCqH9D3qKl7JmOkeAEhnJX3ZM
         aDCObWlUrbCVz6eoolrs4uWTN8tk5vpIu7EwiIAfg+PnMgIfELMnVN5NLploBWzmvEZs
         SctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
        fh=R+rrqhuvzP8t8w9Khylr4q/GPN90fAqrieO3qewMl+4=;
        b=Y5GvshC/iwWA5ffHUIVly4q0SlTUnVJjtBKuNejB677WH1TlagWR/8ETenoQHwr9HM
         iWLaeZrfNpRww+RA2NdBUEyXA9MFDLkCUoNmDxeDBz8i+eoxGqZcQ6Js5DraKMhUmhWB
         xkKp/iQHcgw6jGKfoyFBQXo5AgyjB5uOQQ/BFb2R+m7iaXPixZvWEqsg1/vVW1cABNJW
         7iY/bSCQRmAiLqhF65xR6Ye200cr2kAiy33w7fFdSoXfI1o2C9wiTkBqa0zbDykR07rD
         pGZ2S9KVWwUgtswgDwDgRvwEoUl1s7JrkBz7PTvEI79E6CxcGs3XRJcXn44OZM08GB/6
         8EAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778151248; x=1778756048; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
        b=If+aXJer1wEhFbQu/wVtADCwb9PZjxhYmN59JyeQnmZXVwkyjcNt6Qmw7xB50cPUOm
         /OlY0+i7T5e5/aQx7oYaRttZ3RKH/BZ9tfkWxjXZHNInYieI1nkx3Zlqxi2rcYx5T6sk
         IEUY0zyENZ0xHx6oM7U4cDmsW7AKfR5BHS+iFFAPK98xLJ5duldRN3hZ+MopFbWIC8cJ
         U7IscOVA/HPfWntbeeDdWUJUpwPt0ZXiFCDCDgnpQXwMl9PmJLRmUFvaYe/KcYyY6Qpt
         3e5BSTaOtWwxzFdakQiEKSM3+UNJZ8fR9kH+dnJ6OmF0aB7AHYRxWvBDdit6kR89/E9p
         iIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151248; x=1778756048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF7uiHUYLYrhqG+FspNFwJJCVwTRPmqazl4TaUyXmq0=;
        b=IvH3Fm6/Bj4YuDCnbRt/uAbhO9++NTmdp06s+WWfFgBK7vFFMP6ICn/2vE3Gm67d9S
         CvVyUtdVE1/AQPWMCRSoWkVNruYel4SbHkJOIUu269HOHAxT/OFH6nGkRumcUWNDCacR
         eFh8WUJZrdgHNlgkIAcTZquPh21ARMQWmRXIucElelZqDy/unMbijPCxzfMUy3Mh/S34
         qzJ7TZFDMMy1hYl0Jgq9AiaOi/VlFahIJXpyW2k4mnQ05nwRFszo62Y18hxfUdkGXzph
         QUjneu0YozdsYvWIpukHpkoWZPcqVY0gvQh9L47HjjEspW8NZKMWIwPXBiI1XvyyxEJ5
         gyGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pMDOQrrYzTdgCvzvyjVxnQHDZW1IbWRdh7S0r3c1a+siKyyG5VBYa4FY5TnIAQum6phO+YGfX4Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm16Ti0k4zrBJDVH4E/VmUJw3uNiXrdx3PJf1cqGlgWBgZ0YR7
	OhlIr71+XCyP62tXtJYYRitiezrUhM4eaSrIQRaDemMmaLQ5zuLG3LBR/mM5hSHMKzI5UD8HIt2
	amGA4uooGT2HsYz01vHTWznBWhziDOTmKowPhFAQ6mA==
X-Gm-Gg: AeBDiev/3AnnpW6Lkno0l9bO6BXAqBF9jlNK8PjX+4a8sJLu10nvzKsV8akv91ujafY
	oOQmkBa7C/uGBbYnfp0hutXCxYwFHHmjPHyYwmknifglLh9dIVZO/Fk7e0Bm34d/OWldYezwxdW
	HA+3+tMxi1pfMEMa7MunFQcphA9t/+7tG2IqU/N0JzyHii4U5KoTThsqgUc9RdhBrjOsdUGtbxA
	8VYY+GOZ+GRG8TeODJ+Noc0AYUjMaYWBu4hEO0P+jTHqlOr6EjLAhSLn/5TXHaDfw/I406rJfRN
	cfthErl5q8TrMc0SVbEWxPCmShDM2crk7vI1/E8ckdLnF4l712k=
X-Received: by 2002:a05:6402:3137:b0:67c:4e1b:9134 with SMTP id
 4fb4d7f45d1cf-67d642c320fmr2566539a12.14.1778151248006; Thu, 07 May 2026
 03:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505171457.1960837-1-visitorckw@gmail.com>
In-Reply-To: <20260505171457.1960837-1-visitorckw@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 7 May 2026 11:53:56 +0100
X-Gm-Features: AVHnY4LKSqPHnQncQquj9gD7adTrcRRUygj_CaGGPmUeQcE-vkzmMD9ri7yM0M8
Message-ID: <CADrjBPp321nAD1nKs3VApd-6t6guK7b6k-cjsXHhS19_fJiOVQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, alim.akhtar@samsung.com, semen.protsenko@linaro.org, 
	wllee@google.com, hsuanting@google.com, marscheng@google.com, 
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	visitorckw@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 18:15, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>
> In the peric0_clk_regs array, the divider register offset for USI6 was
> accidentally listed twice, while the divider for USI7 was omitted.
>
> Missing this DIV register causes the USI7 clock divider setting to be
> lost and reset to its hardware default value during a suspend/resume
> cycle.
>
> Replace the duplicated USI6 DIV entry with the correct USI7 DIV
> register.
>
> Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
