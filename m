Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7991737CD31
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 17:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778605387; cv=none; b=SjQYpWLGdvaQtdhsNND8QAxm9VJG1YbGPE30gTrnqNN1aYurQnxkl9wG/t9KfUuQgZqGY96ruzMn4oz1bacNFMnLuXWm8pHYDY3Zj65bnFyxXK+oTB7LwzdSGhMx1oLv1IneR6OVfyHV2Q0E1qAJm3BSS46hpA7UXJYDkN+YJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778605387; c=relaxed/simple;
	bh=Le5r16+yUuDIPTMWqwePhLNM60I4TFMOT0tsNSaruGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0ipsD7c4+exOxpk0rk3Vn1i8qzvGDRXyiKz+K4xoECnY01oTQFuwsHIZo14w6yxp4Np4Y1a11X7icShO9hHRfayFjjjFlAEJQF5QxRCTO44jDpqR/pFB8ZJR7lh6oLVlg2mkuzveOFntwylhYAOE9oIccEqShNISXNCSsg8nyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgCAyzcp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgCAyzcp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso40181335e9.0
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 10:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778605385; x=1779210185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le5r16+yUuDIPTMWqwePhLNM60I4TFMOT0tsNSaruGE=;
        b=KgCAyzcpd9wagEez4Kh8pCeGyc5Zr7mKZ5ZqKQsE9jd6d49GyhahbZKT4R6nZB95z5
         G+kfkrEmOZ+tz52vn8mXHnmfYdn9GG0xnBHxIpPawZE0XF6AfbILYFFl9WQ1eVTdvNzE
         uel6bIyGQrhZjRc5iCRLSZTxKqibzA7P8ErVdKXednEFfaqLmsdRu68hfKJnNw8zWScT
         5LKBYIbEcVBltuk1s8R/sL84bf9xokh3MbUE1S0z+GqHeuYcuTYWYtoMM4PPyJ2RlR1O
         7DZ6nuwxa8QfGuH60CPwXwovpMQUW3ChHcfQzR69rBDWcoAFiAoOdySSl7CZhAORJ5kt
         pYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605385; x=1779210185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Le5r16+yUuDIPTMWqwePhLNM60I4TFMOT0tsNSaruGE=;
        b=bmDmkHyJOa86ghw4P9pv+ftCds4Y1MbUBB5UJMcZE5oX9t54BtYCbPhK0Sz86z8bLC
         TqOvy3pw/3gaHw7/dKz3EumZxMiLR8roBqCEOSn7qn8b+F5CzATdqCBgS1s0t5UK0KMv
         8gQIOWyqihXIPHqqJedfzsfvsZAGrcFndadsQJWE3br5tAeYkI5OtsM0np2OA4ZJbnD8
         /hsnHRQ/Fs09DlmC6qpRiFPYOixv6mqO++cFM0uuPYH6SFzDjmT5cJWapcIu07bgVnmS
         HmcNLB2ysAogFcVxQwrgDcWvsLZOPSHdYsvl2Q59SL3XZ9aE0TeYho/nBkxB4XoJVYFW
         7L1A==
X-Forwarded-Encrypted: i=1; AFNElJ9CoFHlEJ7q8cqg/UyDEATF6yAWNVgrjNOzx6bnrk0mtR5TDrVPZkkdz2iyYlByucHUpeD6+IqnAZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGUTuJUr1lDjSVLDrq9khy6RiP9YWBDZ11DzZIrCgLWFnCgCXf
	Rx8a9UYu38jaNo1ty/+hzCgRzMVQEW6s6V0Pokmyo2Q64/DQa3scrTLmkqh+
X-Gm-Gg: Acq92OFvNEpMwCamOed1gHMsmovZTsCrm32vm0YwL7Lw8/Vdds/WR3G/KqU8OXuieKH
	nwQ7F0yk0r2kiXBRQRJaezfa6ZoSi0uaQN8P99D2TvfBv/yCJsL1wp+ofXYcMsdMXrlDPKFHpzy
	4eFg3WL70p0fdXhs2o7tcyR8EQ0Xujop3e6oWtqwq//rm8Fw80FwZYTHhGQ5UpYzyYbjoI0tm4y
	M1cbgI0Tmx4qwrWzAQmCwuIhjgvIRX0ltMX/g5iRg+aFOJEkcKuit95IG4Oe4cqnM+cC9BLR+p3
	52atZyE7tgj4OMVey3wC13tsCvUD9uaAt3So0U2mH//nIDooCFRiBl6wh2K7u6HuHWPXqlUMJ06
	DqAUDlpNJYC5JCv6DEegA3jlcMNROOS/6RsFQo5uxFhT1zBFZY6pHFYLcgnShgRSikXCZfWf6Y7
	33a/EW19CvUVZP7prIoNZIXYHRBN9THwdMS/eEsnRpbSef2bzNKFHV6qmGB4WzJ9q8x9PByEsG3
	K4TP1q3wwGlFetf3wlA
X-Received: by 2002:a05:600c:2e87:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48e676a4d68mr193704045e9.13.1778605384783;
        Tue, 12 May 2026 10:03:04 -0700 (PDT)
Received: from sp9.home (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d624fbsm27177615e9.10.2026.05.12.10.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:03:04 -0700 (PDT)
From: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>
To: mitltlatltl@gmail.com
Cc: andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time
Date: Tue, 12 May 2026 19:02:51 +0200
Message-ID: <20260512170257.8920-1-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303150152.90685-1-mitltlatltl@gmail.com>
References: <20260303150152.90685-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
> Gaokun3, the image will stuck at grey for seconds until msm takes
> over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.
>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

This patch allows to keep the built-in display enabled on the Microsoft
Surface Pro 9 5G (Arcata) using efifb and software rendering. This was
achieved by passing the "module_blacklist=msm" option. It is really
useful as the built-in display is not yet working thus not described
in the arcata devicetree so far.

Thank you Pengyu.

Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>


Without this patch, the initial EFI framebuffer gets disabled a few
seconds after the initial boot messages. This has been a regression
as it used to work when doing the initial bringup with Linux 6.9.

As mentioned in the similar patchset for the x1e80100 dispcc driver
https://lore.kernel.org/all/67a51928-1c16-48a6-ac65-f67c36297e5e@oss.qualcomm.com/
according to Hans, this should be a fix for the following commit:

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")


Regards,
Jérôme
