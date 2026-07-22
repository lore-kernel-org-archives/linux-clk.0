Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF935F164
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 17:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742241; cv=none; b=FPXLbv4Itt7oOV8t4MHopXCDe3jciEGqzeaxCPvvy9fi6aS81e+qqrST/IRFXYF5So44yISdtfb4/8GpZ0gS2hn5mHLxWUydl7hi3U6Ze0YGQtiqVUKlxxxHLNz6YzcWPsdKx4PqDRRZbZjJsvmVE4RZ8B0TtTu1ojeauJrl+Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742241; c=relaxed/simple;
	bh=E/g1N4QwqpckT0NASK2yVHIbntEJkDAoohaN0e1WJsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYDS56dkelCHbSeBR3WrX3KsFefxorkh/sefACoZjgF9l21FslO/8aZYj8TMfPG76eoeAHPPLvc5UwRcrhc9U/c8rNK9ceNSXF8BE27PbDOI2C26KLJZPlADSmPIed7gsFNGiOqBwgP7T7TEWheYjhRGMZJm76OD4t/UfBBRpWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxgd6TWy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxgd6TWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064BB1F00ACA
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784742238;
	bh=E/g1N4QwqpckT0NASK2yVHIbntEJkDAoohaN0e1WJsM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=kxgd6TWyY893yueMLrXlnp5ac7BzRiIHAZYIuQsCnoO2GnN/lq4RN3B/ys8WxQyYY
	 7sh6FM5JJ27QPEAYxgPzf0iGbRRC7wfTNnby5PYgUWPinBSQweW7zUpPWumsBvQnHy
	 lp2pjT4U+Yo1+dulguWPZHaMGEnjrwJTYM/fjDESEY01KevIllhXu2jcLPPg2NUTC7
	 fdqTiF38lTID+JxuTjJbJc0/zhakWmably/XXxYC9vvdA07zZD4XX5vD0/HrzcNcAZ
	 NkGQxUBKJLbPSjm4mS+i4/h9p+dVjWOO6c6rjrrNEmsoNWy0tbDbSER7Z/3i6vHQHG
	 ywSZeoJdhJBdw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso77840231fa.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 10:43:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq0VWrQXmAqTVNRULzL/vI2lpoxICTzZfvS7pYfowt40l5s2TnIP53BMb+ofa/YgOmiFQ4H9kQ41ik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm1Ri4YD/ErwHmBN9bX5n7W/5kJHlv6S3hnRKpwCqRJtF6R36p
	Ja+1VYXKiOb4Cugg44s4HeZWu1XtVtiGYM688R+wp1gntdeBhsHWg4a5r6jK9QpOLeC0UpXCWyl
	sjlzkUBfVHZBuiH5DDBoJXqLf8PI41lA=
X-Received: by 2002:a2e:a593:0:b0:39b:14ba:a5cc with SMTP id
 38308e7fff4ca-39eb294c024mr42599721fa.41.1784742236447; Wed, 22 Jul 2026
 10:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
 <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com> <20260722173714.2394348-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260722173714.2394348-1-enzo.adriano.code@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 23 Jul 2026 01:43:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v668dnH4BT=2rrWq+s0Bc_qfpRpS3a17wEeDWNxifD3t2w@mail.gmail.com>
X-Gm-Features: AUfX_mxhUF5O2qxLlZC_gBBNFeiWZssw5GcuKnEBQjVfI4pbcu03QcQpsETrUsY
Message-ID: <CAGb2v668dnH4BT=2rrWq+s0Bc_qfpRpS3a17wEeDWNxifD3t2w@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 1:37=E2=80=AFAM Enzo Adriano
<enzo.adriano.code@gmail.com> wrote:
>
> Hi Andre, Chen-Yu,
>
> Correct, this was not tested on hardware; it was build-tested only.

For future patches, if you only build-tested it (which is a hard requiremen=
t),
please mark the patches with "RFT" (so the subject prefix is "[PATCH RFT]")
and note in the footer that it needs to be tested on actual hardware.


ChenYu

> Thanks for the review. Chen-Yu's point is right: these one-divider clocks
> should use the single-divider clock class, which already supports
> CCU_FEATURE_UPDATE_BIT. I'll drop this generic ccu_mp patch; there will b=
e
> no v2.
>
> This analysis was done with AI assistance and each finding was checked
> against the cited sources.
>
> Regards,
> Enzo
