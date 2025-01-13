Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FC722CF14;
	Mon, 13 Jan 2025 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767946; cv=none; b=jsHelJPkFygsmHjsLrljsDqQ1DqxhxGRUfJMC+6m1Pxh7+wwNqZOuIiz2kVREanS8UZ27A7tQpFR2rkSb6IuJT9E/oYHx4vpPcKCFINIFMrwZ5/ro+n2GmthRwwohytFHv+CikjcJoY0s6XK0LHxxPPCpQ+hl/Kp91G6857EHvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767946; c=relaxed/simple;
	bh=E9xvrqnW+VBO1hDzevsMDq0uH3GHVOnfwXnuQ4wvPOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvF7R2MkrQBmRMTSoDULXKA8F6sD2zNk/H/82Uu55DGrnU7ib55VuO991aPy3/5e1+AoV83BWYT0V84x6asHRFL0tj1kg9VsqDs1JLP0IckjN5TFlR3KvgxdnQr0SkNDoatQRIuQOcOJC2Q4HOAWS0QZ77lbusz3l3EyN0kFYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3ej5hGn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3ej5hGn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso5522934a91.2;
        Mon, 13 Jan 2025 03:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767944; x=1737372744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdUQ5pFlwAhGjhMBv/qxKwymoKxsn1QZobVULm/aga0=;
        b=F3ej5hGnu1Y94k/TTRAPZ5fitDYd2syLFiMm43avf4Kuhb1f5VtZdwGnqTQZlWWuFX
         Pgt908qhhnT+9OtJpchbVf4fp/RzC6deX9KgHLqCdMFYOdm3prbdOUnCzJiQb9eJ3GZz
         IZMSBdhbrTQMMPFmxnPba7F+cVe2+4A7Y1Ep2VLcMCBCQ/XGkbhM3AC7wd4CzV2nw7jt
         NcRBHtNW4X+8ChnomZ5CVkur3oEJq9JVEzyXW91CNvgNsp9VKvDtDcZti44KrkwA7Fc3
         8D+4GPPhFdQZgPD7GgMKSPu8MLa0fNiImg3KFALRzKPzgecBnLpJOgcdtFwawWU+8Hi0
         9KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767944; x=1737372744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdUQ5pFlwAhGjhMBv/qxKwymoKxsn1QZobVULm/aga0=;
        b=hgGF8HHbGuA1bXyhKtNUhDtHr1pPRQgd/c6DYIip2ys5jJPNMGQjp6swLPTfU4StEd
         TYpaczxNE/3EnNntfXADybj60l/3i6b3U91eY9FqfmFn2unbrQRcFu4ZmF/pwsH6ZuXG
         lDcpqqpmV45QomGJtVYzVI+M0GznUbIZICRsKnuPxGC3i7c5bc0fEzPzMcs7BiIzpHgA
         aXCezrmE3V+cSxNcLtupP887N2egyXCNyZcmuSBYblXxDGNQqpvh4Y6BCldFyO1NYH9V
         TwJPBEv+P9nfzbuMQNUpkSKxAaWC1AyzfNW371t7T45go25irtrOk59bk3keF76oz6TF
         5Yaw==
X-Forwarded-Encrypted: i=1; AJvYcCWWHMYxPzmTMDMWewTaEuRABn78zVsDZTT5Hnz3CddM0UCRZVM2Kc7yNT2HnsycTaXILz+clbKA2ANXcT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ge8ixjfmGpMhbvJIl1562UsdaXBxSYGqz0zSW67npquv5D9+
	2YswJDTNvlACThQmPK+4MvpLpMedb/P/C0ismjB3T/dn8giQ4dpj7BqOi+QGrbyNxJ8DwlZsywY
	Ma+JPO17ioRwMaRAR6o+nBx29nMM=
X-Gm-Gg: ASbGncuzY8Ph72Z3AVRj5axIZLYVjNAU5qg1zKkzxB44jCwp5TTL9zZyngSsunJn9JX
	iP0hU5c9KO45mcG8UN+sob4ABvWO91Z3FUvtq
X-Google-Smtp-Source: AGHT+IFG8pzBrU9mL1lPb8EPOFE/vtJdiFyrLbD6Unl8qPnsyHyaZ1l0q7kfB8HNszrqD4d2PVWBWbOHM+7ZDdvPLwI=
X-Received: by 2002:a17:90b:540e:b0:2ee:a76a:830 with SMTP id
 98e67ed59e1d1-2f548f1b2bfmr32183855a91.24.1736767944052; Mon, 13 Jan 2025
 03:32:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113082818.345939-1-sergio.paracuellos@gmail.com> <ebb32bec-3fd4-4129-ab5d-d519b10c4405@kernel.org>
In-Reply-To: <ebb32bec-3fd4-4129-ab5d-d519b10c4405@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 13 Jan 2025 12:32:12 +0100
X-Gm-Features: AbW1kvZJz1qPg5kmeLaqEi_hvZWGSQGa_k44ttvOLGvckR81-xePHgXtR8WqQWE
Message-ID: <CAMhs-H9ysdJ9nUuStWJpRqTzm-09ZS5TMdhWgKMZx+JZdo6teQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: add clock definitions for Ralink SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	yangshiji66@outlook.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Jan 13, 2025 at 12:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 13/01/2025 09:28, Sergio Paracuellos wrote:
> > Add clock missing definitions for RT2880, RT305X, RT3352, RT3383, RT535=
0,
> > MT-7620 and MT-76X8 Ralink SoCs.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> 1. Please use get_maintainers.

I did but from my tree which is tag: v6.12.5, linux-stable/linux-6.12.y. So=
rry.

> 2. What is the point of this? We do not add constants when there are no
> users. Commit msg explains here nothing.

All of the old ralink SoCs' dts files which are in the tree are not
properly updated. I expect to have them updated somewhere in time
merging real base stuff from openwrt dts [0] files. Not having this
header with definitions makes very hard to update dts and then
checking the driver code becomes a need to see the indexes for the
clocks to properly setup a consumer node. Because of this, this file
is added here.

>
> > ---
> >  include/dt-bindings/clock/mtmips-clk.h | 130 +++++++++++++++++++++++++
>
> Filename matching compatible.

There are multiple compatibles regarding this, since the driver covers
a lot of SoCs. So I preferred to put them all in a single header file.
See [1]. Should I add a different file for any single compatible
instead?

>
> Best regards,
> Krzysztof

Thanks,
    Sergio Paracuellos

[0]: https://github.com/openwrt/openwrt/tree/main/target/linux/ramips/dts
[1]: https://elixir.bootlin.com/linux/v6.12.6/source/drivers/clk/ralink/clk=
-mtmips.c#L996
