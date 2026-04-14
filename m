Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3373BC69D
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167381; cv=pass; b=oNcBJ21iWcvRu+zIXrJ5aO8PDaO7NQJBCLZtZIJ9ea+852cC/XHhy5l/F3ocLwq9lEMp2/OLmLA9PXA3P1WI+oWSvH4+/sGQSxgOmbkPLYgEfQe3zLQ+wSFArBiPcCcN/EQGZ86lleR6n0L9Dez1N4IBqIQHvd6RxrlC21TwKuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167381; c=relaxed/simple;
	bh=Ufv4J6baPU2WSi/6wgzJOqGGMtNG672dGk0L3nk8cPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxd2sAmuLB0mE2OgEtX28kTENj7KPIQ0GEkGzj/RaBdjzSsoLYHDNTNQcnOXqIM2XKuZTYdWsFspKIBJbkKzY07IMwCH0R6KRPxYSFCo0AUQKkqYPrZ+X9T9zgLnW0VAhQRJXGzdvfECoAoDErKZ9ptkLvNaY/DAJimEpXf2INs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URejJB3K; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URejJB3K"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-649278a69c5so4370115d50.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 04:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776167380; cv=none;
        d=google.com; s=arc-20240605;
        b=ksK4LXmqM3TKCYh2GKbenqGBSfFpZud/QIUiNp3Qd8iXZGNV7lSPh60GuwIFT3IU6z
         QHR0PB+798yzcjLgzCcB/lP7Jl408bTt5z7hH3aTwR1whfsTGOPtdhQ2djPpHARhln1U
         k8tnFNWVWnT45vkSlOy11wBAtU9rb7orzH7TDAIDwHuqt6E4qxfVbPzzB427M+OXsNLL
         3Jf0jPvzTLg4FZkN3qnpto8PF+Du7+j/KItZ8WQh7AOWaoMJzdAUo0Hf6PelFA4xsa92
         d3YchF0McQ+tV66vk1hqzCRdl8RuHFkCWMsmruAPmtVrEgPbAQ6Uk5lj/txR1iOvTBcD
         jZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HiDQJibsW8Dy2yLg815wN14aFJJg7FhsN8DrnEwbqfQ=;
        fh=MaGnf67+0CEt5JGmwwsKv/Rn8RrUrtusQCpQ1nIyZF0=;
        b=e8FvFL6sQ2MzZj1ID5x00bfqHuINja/58f4d1MebAdV4UiuH+xlReyaU8HUC5k7YTJ
         QWp8LzCjDLKJmUTACllP7LjdYFbay/hYJGdF42uMm6G3Xvyxi/PRyAHkSZlh2sshNxQA
         rRgoLpV3su2Z/SFa3T3VjAY3IovRg4otrXNu+pyud62ulAHt3ztOtdwfDcC3O1pkv+eN
         CFyEHMhSclhp0SQfYUojV0aBRq8gRg1pw6ct6sxLagYS3okbQIQhtibm1UGxssbmRCoo
         CoNptTp5Y8jY5HieKwlhAMTOEWkEgjscK+mmZiTddhl1ZOYTfRC/yid12UWA+lavFtPy
         DbIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776167380; x=1776772180; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HiDQJibsW8Dy2yLg815wN14aFJJg7FhsN8DrnEwbqfQ=;
        b=URejJB3KMDS8eGFvlvpxhNXW3QoWDlX/5lhYSui6BdQxQoOi/imB9QpwVpMUK5XJ2q
         pyJMDP1AwRbZc6+dO1yrrKtCpsO3ybftnZMw+5hHNX0Jhh7M54nGq8ZiwnpR/MzbtRhR
         fZhZHGZzpSnpLhvBp9YWmAOHqRwiyhoXYxnsU+rRmBF7wotHxbb8XJnzu4iRWpZFDsv3
         P++dFwmXobx5MdArAgHOSW/J2KSyr89uYTxHiuf1ewJKBAxBSLWxKXLOz5OHk1tZ3Rgs
         2FY0ym9LO32IDmfUN139hggs36w4u8pBUePz+6c8cO65zKoCjvdO8nEqkx/xUO4snRk1
         gHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167380; x=1776772180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiDQJibsW8Dy2yLg815wN14aFJJg7FhsN8DrnEwbqfQ=;
        b=Pn5VrFFBGFn8f9sAGkCb9RA7QhL5nbrSrGJeNWlySN+MBwOWGlcKaSSL8L+sWi04MR
         ttUVGC4rZTsDT0B3T2tCB5xxtUm0KomzK3lSuN0GCkdRmcvDdNSgCiZ+00G/6CDHQKi/
         XWa5m9UBl3SuloE5HV5UdoEzcmhXHknzGV3KZOaTTx7GsiaqezawVdl8aRc3+SouFg9P
         /Aj54RTbNzlLt9Nb5qitnra7eQ8QbKuHy2Dq1UB5iVYmLPUOPOsO1xLz9eGRwv+s7BHA
         jY2/sF++CEcKlF5nxTUpK5Gkb6ZG2K5YavRYMwc3WhYRgrLe+tYOaoUYBAAJV+qsJJAR
         UVmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Q4blS3js1tUpD1bpOuiTIfY+NOsBALMdkjModHcP7uQSQI+//Ze2760p+WaeFUjIbjckTYGTe+fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzREAl0q1OOY4kHFFqo+OdptYEojOiBeiA4ZMGMdV6Mkyzinrvp
	hGD9VjXqwOvecpG0FTJDGG2UCuJxvTf+n/GE3JtfowrU8jUbsEzCIPEqSpTNdPtlHTlFUO36r76
	1tZxrBzTSlnQg10WcYVQEpSpEKF1QSkA=
X-Gm-Gg: AeBDieuXFTLZ9nIQwYD9xfwakrLiXFXhWwmrLapAf9pZ85+JZa1suRNaGP4ElS006IH
	NTun+WMHMkj8sr2NxavTH0tOF5bNQO/07rW3h1o6h+E5XgOta2EPw268Io+qXUq0uaq2Waui64Y
	gexnH5OeP5IwuM+/3xEe2aFBMXx3dxeZKgjRahnxxnwrRh5cde+UtNWE+k+EkGctgBZQO1vG8L+
	GITbcU5VPM3BaIrdEr9UQ3cllX5s/VTCMak/P3LH2niCXOoAcOzRpe/5vqM+letBZnT7QGh8KBZ
	SfWcD7kjTA==
X-Received: by 2002:a05:690e:1511:b0:651:cf23:6612 with SMTP id
 956f58d0204a3-651cf23695cmr5327604d50.34.1776167379766; Tue, 14 Apr 2026
 04:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412124247.2494971-1-lgs201920130244@gmail.com> <ad0c8y1u5zAhheJX@redhat.com>
In-Reply-To: <ad0c8y1u5zAhheJX@redhat.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 14 Apr 2026 19:49:31 +0800
X-Gm-Features: AQROBzAHa2QmuGgpHDSe-Y4PCign0qhbR1MGtTMMAaOeS4o008iXPrSOjj65ZYk
Message-ID: <CANUHTR-9HYnCuavM9O_wcVg3VuDyV4zQH4P9jYhViBj_PbYV9A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create()
 error path
To: Brian Masney <bmasney@redhat.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

Thanks for reviewing.

On Tue, 14 Apr 2026 at 00:42, Brian Masney <bmasney@redhat.com> wrote:
>
> There is a leak in the error path here as well. I think this code
> should be converted to devm_kzalloc().
>
> There is no devm_kzalloc_obj() yet, however according to [1] that should
> be coming soon.
>
> [1] https://lore.kernel.org/lkml/20260330154108.GA3389518@killaraus.ideasonboard.com/
>
> Brian
>

I may be missing something, but I think the auxiliary_device_add() error
path is already handled here:

ret = auxiliary_device_add(adev);
if (ret)
        auxiliary_device_uninit(adev);

The auxiliary device also has:

adev->dev.release = eqc_auxdev_release;

with:

static void eqc_auxdev_release(struct device *dev)
{
        struct auxiliary_device *adev = to_auxiliary_dev(dev);

        kfree(adev);
}

So my understanding was that after a successful auxiliary_device_init(),
the auxiliary_device_add() failure path should be cleaned up through
auxiliary_device_uninit(), which would eventually invoke the release
callback and free adev.

The leak I was trying to fix is only the auxiliary_device_init() failure
path, where the function returns directly before that cleanup path is
available.

Please let me know if I overlooked something.

Thanks,
Guangshuo
