Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B9628DD6
	for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710775292; cv=none; b=jmKsCR4wtkii2EahpyJhDgEtGXenK1VJz5g5kMMkLzR3q1yIUxFgmPVPfMMizjMsXG/2tAL/tT90KSKivWKTBXfAYqUnfPioSPVKTKFLyB/nOActBoXo5sSDRtw5JfJ1Larp5UQs0qy3z7RMC2IJq66p4CPTCq0OWJ8qv9DTfwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710775292; c=relaxed/simple;
	bh=qYFnOCn6WDf/TDGMX2fOvjOWt1OS3MGMyadhL+gfoDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dup4luCVVEnXWrquCnyQa3jis6DHkwEIrRp3uSnDe9IIocrWm50fSX88YZvsVHN4+7Y8sAak5ek7A1sbyRMEaV9BARw8Q+krLRY3u34Kuy8F8yxWCKj7XE0qwrIt7duMVdy1nCVvJjjv7DPcsNdvZaNdh2lxwgQcsgTksY3iWAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8/RU1zk; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8/RU1zk"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso4102441276.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710775290; x=1711380090; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hOVOG+zKU5pC1qctxxPXGwr2e/TIrZYm9xcdBAyBJDc=;
        b=N8/RU1zkpnJYM4Tcm7jCRKQP0ZfJS9cg1Eeok6KbjScryXhTEs3jmM8CVBZDSfcyTt
         byOgFbQjBo0sGS8flfRMBewxu8oT2Z28Jpp/OlS20Bdv9Xp2+n+q3uwAO1++bbmePSzJ
         c89xEPBuSvSOstryLDOJ6DzeTKJ5Zy99HsfVluYxIfFAfwCJyyWRJUoTb1V62IRCUkO/
         WCW8kKvGkeL4Bqzr+eztQz3o4lSSmQYkxj/Tw0jNuxyZqzUaezeieri9801EneFnncUW
         99fLKIo9gl7JKR4eWfgMZ57ZGBLMAfE4pDg12GoDE6VhYz34+L4H72BnGh+cAerb7Qfm
         qk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710775290; x=1711380090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOVOG+zKU5pC1qctxxPXGwr2e/TIrZYm9xcdBAyBJDc=;
        b=VsS3G1cMG+mJF6bBwNzs6FHNt8FwIV8ELQZ36dGwO9wtbKVM2fzj9bQXzfVQxBRC+R
         atBc7wcR/z7wlF0tgJy1eVKycCUizn8qgo7649d0ax6l3Vp+jCV0xuVFUj10zSfPNZAz
         0eLgEFk+tykoPwv9ia4Je6QQL/ErNvo/HboCZxylc6B9j/X/ROTs5t6cbm1DAh1wjmHW
         sk0cncQtcDyJmwiVxOVtncw3pIv+oznk4yfYr/FGvGSm1oyxI2kXEg9MNS2xaty9UD8K
         Vy7wu10leOXfuDSHpJynrRXJmsKS4MwxkhI4Cqp9GcFDrG/ussigiZEl8IUZwJqJytEM
         +bgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxKL35MUS+TBLBsQg3gL9zI1cV/vi7X8F7/qIlpcZsvoAJYp+bzh6gliJJf1QWTWXVk4ibGxZ5utwDBxkGSAvHENRuMKhPOITZ
X-Gm-Message-State: AOJu0YxhmMv4ETco27KB5UAigKfr7WkdlvVK51PENJh2wcFm1s5bapUi
	0rdtbi2Sz1PbBqAkYpHDdmpldN/xChZTwqLG4VHM1rJGfc1RmVZsJaljwr7j65FQ33oQOWC0WHU
	L3XpE2XHHF8RKuYkz+h44onecy8O9PLL26ZWJSQ==
X-Google-Smtp-Source: AGHT+IFJe43EDKmy0gsRwURevoOtqocpaWKI8M3F4/AHqWtzh9RYrXXwtHPYbESuPhxVR8rlneuVdtvcCGFvYumLYjQ=
X-Received: by 2002:a25:a2cb:0:b0:dcf:bc57:cd61 with SMTP id
 c11-20020a25a2cb000000b00dcfbc57cd61mr10785295ybn.50.1710775289937; Mon, 18
 Mar 2024 08:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-fix-some-qcom-kconfig-deps-v1-0-ea0773e3df5a@kernel.org> <20240318-fix-some-qcom-kconfig-deps-v1-1-ea0773e3df5a@kernel.org>
In-Reply-To: <20240318-fix-some-qcom-kconfig-deps-v1-1-ea0773e3df5a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Mar 2024 17:21:17 +0200
Message-ID: <CAA8EJpqxuVrL7_OYCAFaMM8bocpRHbqZ30B5=KS-7wUn2vH4cQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: Fix SC_CAMCC_8280XP dependencies
To: Nathan Chancellor <nathan@kernel.org>
Cc: sboyd@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, bryan.odonoghue@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2024 at 17:19, Nathan Chancellor <nathan@kernel.org> wrote:
>
> CONFIG_SC_GCC_8280XP depends on ARM64 but it is selected by
> CONFIG_SC_CAMCC_8280XP, which can be selected on ARM, resulting in a
> Kconfig warning.
>
> WARNING: unmet direct dependencies detected for SC_GCC_8280XP
>   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
>   Selected by [y]:
>   - SC_CAMCC_8280XP [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
>
> Add the same dependencies to CONFIG_SC_CAMCC_8280XP to resolve the
> warning.
>
> Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
