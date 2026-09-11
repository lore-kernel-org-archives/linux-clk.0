Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5783BB680
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113072; cv=none; b=C84LLDeZwNfqTE3FiDeVcNj6gPMWFSJeunNHjzgADp2/c3hh65taApMr5QstxPEd3uLtw90twAbP3Alp84cSYDSHRU+DFas+eaLJRJfs1AcZuQUJek39jz/Znu+04s3tXVc27Ccdrdf261ohDqECSWqJ8i1DggMLSPMVY878RNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113072; c=relaxed/simple;
	bh=EQswtJ3POdIXhCALaheNzM1TnP2uc1nhkY47KA385Hw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bk1E7DVe4eWH1bbEHElcx6aSWwKE8yh0G388o3qirZf591d50B/39nW03fcJtJJxUnChfLoDEXVBpp4NcL1DaXE0RUuWN4dmVnOiQanLRyCqioC1icC6oS0cpLG7AU9fFIegsmLwQOs5VoxH1+JhmN/NoEYS/1DPgxZBXv1OevY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqrNBPLx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqrNBPLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AF51F008BF
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789113069;
	bh=EQswtJ3POdIXhCALaheNzM1TnP2uc1nhkY47KA385Hw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RqrNBPLxbhzBUPms/n1fQBTR3hHYKCm5qrkSS30jGzPNEpgohPF9UqaLZwPRGpoqs
	 +b71S6HYHHKF4xdorCwgaEyIlRr9EugoKH9AyIU5gEmjNf6NuS1RjyHmfYx0djYXwd
	 qbjNs95/LuO5o/O/+sz7MVNOcohlNqpCjcyXf1ffvLN+D+mmh2LSY3JP7Ji6jBlkP1
	 d61YtENjjSH+73REqyMk8tlwrGCLERb6wZUHnCMUOh8EozL3J8l7ug9BaI3VI+FemY
	 4Sn5ldWKZGfsGvvNRukm7KAtvQK54a2Y1CL0G9wzeHQZtMrFKyt9F4kYgfmc2IfGD2
	 3tdCkh4y0CLhQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b7a9882e19so690078e87.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 00:51:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwrgi16NriD2jaMQfO12K+8PovtHI/AadiXQArcM0VaHTS9bpcwPElfiIH9Z47sPemo7IHb46KLfCk=@vger.kernel.org
X-Gm-Message-State: AFuF++l46wUw10XbM0jx2OJH74QIYfJdvEMjV3gkXrfl3vvdPU9nQ+1c
	rhmMo5Z3T0gbwITx/diUkc51faOXnA0lM/wsGNkfIUn0DzMnJtXsXd9W3YjXqB+csU/NO7uQst0
	hok+Gvs+CCMVXZsJDp4uXuTp0SemPGZ0oKVf/jNPdjg==
X-Received: by 2002:a05:6512:238a:b0:5b6:4ad:77b3 with SMTP id
 2adb3069b0e04-5b8a02ddf43mr662301e87.27.1789113067582; Fri, 11 Sep 2026
 00:51:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:51:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:51:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-1-17ac82dbe226@toradex.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com> <20260910-fw-devlink-nexus-ready-v2-1-17ac82dbe226@toradex.com>
Date: Fri, 11 Sep 2026 00:51:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfmAor3GW1JCd7HqXtALcdsAYw8ARNHseS7k-cVbFqp6w@mail.gmail.com>
X-Gm-Features: AcwNN1VLX99zdUZYPSL3ecujs_j3--rWZ9Roiou4FjiqsxMWc4tiYDfScmaaJLc
Message-ID: <CAMRc=MfmAor3GW1JCd7HqXtALcdsAYw8ARNHseS7k-cVbFqp6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] of: property: fw_devlink: Follow GPIO nexus maps
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Leonardo Costa <leonardo.costa@toradex.com>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sep 2026 16:16:42 +0200, Ernest Van Hoecke
<ernestvanhoecke@gmail.com> said:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> GPIO consumers use of_parse_phandle_with_args_map() to resolve
> specifiers through gpio-map properties. fw_devlink instead parses GPIO
> properties as direct phandle references, so it records the nexus node as
> the supplier rather than the mapped GPIO provider.
>
> A nexus is a translation node, not the GPIO provider, and need not be
> populated as a device. The resulting fwnode link can therefore remain
> unresolved and indefinitely defer the consumer while
> device_links_check_suppliers() waits for the nexus.
>
> Use the map-aware parser for all supported GPIO property spellings. This
> makes fw_devlink resolve the same provider as the GPIO consumer API.
> Direct GPIO references continue to work because the map-aware parser
> returns the original provider when no gpio-map property is present.
>
> Fixes: 7f00be96f125 ("of: property: Add device link support for interrupt-parent, dmas and -gpio(s)")
> Reported-by: Leonardo Costa <leonardo.costa@toradex.com>
> Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/
> Tested-by: Leonardo Costa <leonardo.costa@toradex.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
