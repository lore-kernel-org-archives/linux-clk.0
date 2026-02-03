Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFF4285058
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113443; cv=pass; b=b0XPdoAj7WMw7VlabivsQ5BTBrCOU2iM5p1OMdkPSaThSp68FWSilQ/uSjPVWeoXdL1zJ+8ZgfYhGoI/dGPCCR288zt23fDnThT2+x9CiuemQMNdMCQW8/+Ox9MF34sfbLpRTO2c/Sf3MXdVtikMsJRY0Au9XoU1pfbibxKSRsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113443; c=relaxed/simple;
	bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zs16aQLhbXeBgc/akRnewfFJqoPrKEKJv5dNh/6+SnG2GAyxg4OZ13kAYX67h3NJTkOI/CcuXo5hfg7Xev/9q1YBKz0DhlaYm24G74FkWQKdRrzrEFjTNqinSsNwhhwm+Bc0aGPIKNUCO7jwUIPLHd0uxix2r7rtwh+5bHhNhCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ub+ICt5T; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ub+ICt5T"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12336c0a8b6so5059927c88.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 02:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770113442; cv=none;
        d=google.com; s=arc-20240605;
        b=EEIIbtpsOADom/aunyErtRotVX9WruQp98uaevWehxgyB6IjbBcAxcJJCTni83WJlh
         gcl9riloaAQjMckrxdFFEdGX10wuktK40KUnT7ramxCqNd7ITqFAunlNwuT+HdCMQbbk
         jXgXcLxdkVmMo+xWinOZqiXKKrxQGV6QuCVOYNnz4EJ78qWZmskDApf3yvBeOfmCe2dv
         C4mxzkYznMw8jUrmAMImf0wy43gm/KK6SCmLsz7WVFuSGktozs4P9YeJa8ubtaYiQftb
         GAZEQha0Tz53W2HLLNFhYk7vVqa8Nf/+jk1WkA6HeQ/cJ7Rto1Z6dj/gaYMaokgSSOMl
         2Q7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
        fh=2KlqixdrnUlJTU8S4O7ZKB+PWqaa/7lcGMscoFMzKnM=;
        b=dZpVSQ3ugP/77uhwLrqlECfM3JxkC6XD25WK4iKB1jQrkwui6Q4UYmQBgakzB99GV0
         +8KspZxK71UZVOaXA02bUHtI6a/EpBL+ahgW5ml6q3NAQdPAo3BJ49GilqWLWqx7OUC1
         vJoT9ZXy99i6QyjmvuajgPP5lQD8jL7ZHJ0rI5y+4zdU5dGozN+C6VxIIxhrX/fQi2Ww
         lxwd9VUhm+7gElbJfyJTO7toTScl5inboczaHlBxm5TjaMvyCv1i+Nk3oJVcbLmB1L9k
         GvRrIH8hDM3FNpkaJ1y3yE7nvJzh6l6LLwVy1dmsrGjPZrJmDViaJAQ0CayV+u6F4oyH
         tD8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113442; x=1770718242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
        b=Ub+ICt5TqY1CYJvp4JmZY1B1a2wZgoKp15gR6hmctLeCdRfg03ijZnRfmbj9oS277/
         SgWa8Q7Z6l2MdzX+2PmmMwHO0nLTITX1v35qyYh+VAiSsbAXLfZmoEJc53TOWOeRRgfu
         UBPcXGwHz6iDsTdzTLBmhwplnpd71AbdME6Je8ATCAhbi9zouvJUbIF5eLvUTLF0YPWy
         UryJ5+SD12dEw7JYvGbx9S11cuztQPGRvfj2whlEHI/nfKWXxQA6kJvIEumKJYvkbXmk
         LroM+WOXqLV34cPr5cb9ux8ELv3QwzmR39XfKklvYwXjNMl0DUD6XME634okn5YduVjW
         aQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113442; x=1770718242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xejb0j9EkHwaVU0Gjzt6hJh1Gjvft9+wJcQ8Wyd6gvs=;
        b=FDh4TLkphsEXprkzfc0JTDSSnOy4/7uyJTAVcLK10bNFUlvdEjxXXy8JJHwwOeiN0p
         c/SioB3xJyLK+Rz74gv7ikO8D/N08+KSzNbXEuDr95rnx11aG8VTtBHqNfpUDbS0ztOt
         rBLaKzURuMaOH3xwXIif+C+kxUT4PMKxbg2rMZM+k8o5nRp0PbTaji3i8Iu+ZLUeUFxu
         qeQWtftn1yWH81sXaSviZFyR3SRcLrsAJJV84M3+tgOxWqSNO1VpJhZdcUeUXwdoLFtW
         T7E4LD2+YxDlTjX0lgZyhhC1RNkN2qW+AYkLSJcHF/VOUIAjXBj/aKrW/okIJBpMCL/6
         jP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDH/ElDw/MWRNwfZQSXk1wK4NgT6gdbKxyfhM+HqpBCt6BCQiGSdfQyT5zIQJuACYYGOWL1PbHP+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk35Qukuthf+XoLs5Vs5nM9z2I6p/Ih/YaYaD7Rp1TD2a5IjZo
	yrHzV3M/xIVcSb+ZqqFg1HxwkC+uNKWz9WLiJ2c50+QVJxjbMKEykiuhRMn8BdTv2C8KS4WS8Fg
	O0ONcIUE15B7jdNw/xilFCgOBhIy3zwE=
X-Gm-Gg: AZuq6aLYrk0Qz3Krg2fQsbuyJ41G7DfiWGtDDbmlO8VABq1UGTpHu6JXW7T/MogpHAq
	qJgmSr8Pu0KtR5MSOJ07Q9oh4EvCip7VxL+oVJLW3akPXkY99/N3vjIkveuQbyn9JKRGYMWMEdz
	g8SHc9qJXg+FtsnO2gMdyxdpgpuHQT3o6Qm+Y4CqT7a2y+HW5LvYbSIsZcxWmTgzHmBeV8CSQad
	THcZAg+effDhhgcclMdQIOIblUtT+OQwUwBXJ2QPH/FGXPsKsZ5J6RmlW4Jghs1CWM4xbqV5abq
	YerxmKC8Q8hE+CmGFOY8Ab0PVuXQlV6PEBWjc173GRsT8AqaO194lpmhzfKogVoN3GQ/fIpA6yy
	0/m3nRUlERg==
X-Received: by 2002:a05:7022:6707:b0:11b:9386:a3ce with SMTP id
 a92af1059eb24-125c101ef89mr7226621c88.47.1770113441581; Tue, 03 Feb 2026
 02:10:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com> <20260128-ops-parent-enable-fix-v1-1-ff39cc37f98d@collabora.com>
In-Reply-To: <20260128-ops-parent-enable-fix-v1-1-ff39cc37f98d@collabora.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 12:13:22 +0200
X-Gm-Features: AZwV_QioJ69dZ07wlDN2xKHoYGFZyQ3lUnsqEy_ZM2pB4A9WwAjMHzHhAGnPGyA
Message-ID: <CAEnQRZABuXQsJ4-5u9uP8VM63of8EpiV1LcUxv_vSBuGT1uEBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: Disable CLK_OPS_PARENT_ENABLED parent only after
 CRITICAL check
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 8:39=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The call to clk_core_enable_lock done by __clk_core_init after checking
> the clock flags for CLK_IS_CRITICAL enables the parent clock.
>
> In Commit 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during
> recalc"), the parent gets disabled before this check, if the flag
> CLK_OPS_PARENT_ENABLED is set on the clock. This results in a situation
> where critical clocks have their parent briefly disabled, which kills
> the system.
>
> Fix this by moving the balancing operation to after the CLK_IS_CRITICAL
> check, which should resolve the problem.
>
> Fixes: 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/r/036da7ce-6487-4a6e-9b15-97c6d3bcdcec@si=
rena.org.uk/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Hi Nicolas,

Would you consider please reverting faulty patch above as i.MX8mp is
still broken?
