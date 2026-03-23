Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D63B7B80
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282091; cv=pass; b=GS8SrooHHIxSgHJ4GE1IbswhW7UwInR09DvQyfQvjRHkKQjG2A6pgUmSEx469apS/GCPZOdM4Zy2bKynvfEbQROab5ElWw5XDw+cGsGVu1fe02XlKSOusth107eEz1bl/bkcU0py+WEnwA4+36FkK9cIOa1AJeLEQkOWhGWTI+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282091; c=relaxed/simple;
	bh=iKHq+WQ5shR1PuWWlRfHcjvkyXm7PwO1wqXAron3psY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwLUktbaL51QNgp3IkfqQOD/RJuYAqMfOVi/U9qYakkZNUTDKb6eJhURD+nhbupVj8xHTc4U3xIibbD0cHHJnzxsIPLPP8k8KVXlAcxkvL3aD82KTNX3ZsQPSGSN+o8Krhp1ZJUK8ZeVYqZ9yVikWimakDeKrewkQ0mXrdFxsMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xq0Fl9H+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zp8+J9CK; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xq0Fl9H+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zp8+J9CK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774282082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlpYSn4iu4HLAmc0XU2T1L/rpeJuBDganTKgWCdzs8w=;
	b=Xq0Fl9H+RafJ44I8jKiuszoQJQJFlSJguo3JUIq09U6cEyfeKMSuq8AeUHYxW9vB5LCTnk
	GxdFeQb44WisIZi4xzO4cV1CXmpaHyfgghbfLaosyBOs2Fgy+UUMABFoesWAND0qgexwiz
	aPkTKyhtiT0MX2EDugn6exjXodvuycM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-GFgzRxOVOf-8cIvKE-IfoQ-1; Mon, 23 Mar 2026 12:08:01 -0400
X-MC-Unique: GFgzRxOVOf-8cIvKE-IfoQ-1
X-Mimecast-MFC-AGG-ID: GFgzRxOVOf-8cIvKE-IfoQ_1774282079
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b97fd48d0faso327079166b.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 09:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774282079; cv=none;
        d=google.com; s=arc-20240605;
        b=HUIHfKUFi2FTMjhyFnYhgvcvrxakrypm4m1qRQ1vic5Y580g16K0qlipOyyhu3Cd7k
         zqoj0H5NfaSn5MeQxh3eLspdTST43t5ICuGInLnLO7wWs3gKIojV+c83Mjx38gxt1Y9R
         +lnGODfinhbDVZ4YNMgsgOnuU/fLGkHmB2q6NIl3QtjmK7ma8De785h2y0sMgqL8VrWG
         N6B7BgRGOPhds2CJTbJm21XOc239mKRjabDMo01llllcs+7qQNStdbWMNGvC33XzRXeI
         xe6pXVpFeACOiXQCf+/sut2HsIGs0FVfXzJoiMNb26Y9zlROp4CB4DFIq1mudq+dgfek
         PoUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OlpYSn4iu4HLAmc0XU2T1L/rpeJuBDganTKgWCdzs8w=;
        fh=VWqy2vE8Qs+0Oe74X7x1hYqfon4hKJ2OhecG+NBq5LE=;
        b=kYBc4AKS9m74zvcEuk7LBx91RKczx7woArvij1ZU0g3fm6fg+C6ZZIYXk+stODcsCb
         tCrHfx8vOBC+9UorWsoEqjbkkGjrfYyuDQpRNCxJKXVQMNqopFzrgG49PPYx1et1JWGJ
         XnsCqC3LatexVgWDqv/HSLVEX/skNtLJG/4MAcv436DoHHodhYm84N3LI+ptGFOre+AL
         4RcWK8i+W/HwNigLbsCBlYhtdD0KV51h/V3esZ52/5Dc67G4ub6wM8DIJOjwhdXQhM3h
         klCjAYmOqAzNmItJnC6rJ7OJTvsDpKyxJcE9vcXUuZKuugcXPD8P9AEcF0bNVnloVN4T
         v/fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774282079; x=1774886879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlpYSn4iu4HLAmc0XU2T1L/rpeJuBDganTKgWCdzs8w=;
        b=Zp8+J9CKiaNKxIvDN1scLhWcTxcnl1bi8ny4CK7U9tG/J00bMJRDKpNtvGCI93+Zcq
         RpoHv7qTRzohDRZRJXl4h5cax1d0vbWHLo7bXgnyIHM7+ydY0CKs7SVQa8apyxgXSQR6
         T6tXfUpjD7q5cnEedUtgkNhyloeDOWFRshFhkALW4TQsluSRtoQlXudYRY6oc0eaNb2s
         +ZZ2Qu+rcjRHy3TuLBySBHTMQ2qyV2NxVbJVEleEorvuKH4a4Cksr15z5yv3XU3O1oO2
         TsE7b40ZkezgC3pC9HVLsdjwlUImPJiOj7Oah86Kh0zCYpVk7hzM9SdGeeM7c0Run5Sx
         JQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282079; x=1774886879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OlpYSn4iu4HLAmc0XU2T1L/rpeJuBDganTKgWCdzs8w=;
        b=pOcpckGTfvz11Y18zfIBNoKzJIxWepvlsweDWFE3YHGeRTNb9nvVUPVPnLyzrcYXQ9
         SwbyG6GM6GMfMV8JCYr4ydvgHYrb2Hv+ln01bIea2ZBYN3DyqxtyDhWQmdC3ifcxbYFe
         ptKtzz73190Hute2jvXAxF5ClRAQXz9pwz6mpcTlpp+YdlPiVs+LTU1woNq5Ly1Ok9Y4
         wumLpE7hNSwmFToQ+q0BwKLHElzejB86DwJz6mKmekcVgYrarnRwuLbm0MtJTMX3JysL
         +euqCUIbDkW1nCTS21pGrsFAhtH6FOtkpEW4O/GaA2Ypk8BWYF2orO63/ps1tNSezdiz
         ezZw==
X-Forwarded-Encrypted: i=1; AJvYcCXOwc6ZoxR4qrWtzHohqouJw4Zhe5QAEqXj/GFRc5ID73yyMTr0wKtcdNXXhP24KPGRRBjnjKJxfUs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysaljl99UfvfYTi3qAdax690X7m29RvOABd6PAAy6f2HU80lBY
	Hm7g0qpDExaOeK/fCBIEHLn0E/ab9daQbA3V+uHFw3qskbM+4SvN54a21RQ9J5CF4FgFv8haOO3
	5MjCbzI/dyArpNdnCyTVAMpgwu0SV1XY1DTSSt2qPfpp4wtv0hb18Ds8KduChNhlM+qBzg3UUY/
	js+p0SMfcUMlEm1efU9/F7JjDLvDRGtnwRO9E5
X-Gm-Gg: ATEYQzyFgYYtvedYEuS3iUTFMFRGANeGTNC9k/gXFgrB1ShTXSFLXSK/dsrOTBQw7Tw
	B/cvxaNvbstG3tgCuKW+nAb9MiszEoy5P0xRsJjrAwP5H36hub0ceqQXi1K5Jww5fg0lLs5171R
	Ut0U8JvkIce4ovlWHCgy07p3d9OT++KgyNuegAfJCiezWSX3spaOcHH4MW7DhZcSbYtRmnV9gwk
	jX5ZA==
X-Received: by 2002:a17:907:2d22:b0:b98:4abb:cc49 with SMTP id a640c23a62f3a-b984abbd83cmr576686566b.5.1774282078850;
        Mon, 23 Mar 2026 09:07:58 -0700 (PDT)
X-Received: by 2002:a17:907:2d22:b0:b98:4abb:cc49 with SMTP id
 a640c23a62f3a-b984abbd83cmr576684466b.5.1774282078277; Mon, 23 Mar 2026
 09:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115550.9279-1-mitltlatltl@gmail.com> <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com> <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
 <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
 <abRBT4niX2CB9XVR@redhat.com> <22a469ef-0a25-48f6-bdc7-95ae5541e834@oss.qualcomm.com>
In-Reply-To: <22a469ef-0a25-48f6-bdc7-95ae5541e834@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 12:07:46 -0400
X-Gm-Features: AaiRm52Fb_ecUHD2iOtrqixZEdn0xZt7-HVJ3bLxAUlwoeK0LemmZuTmskYK78g
Message-ID: <CABx5tqK3MymYQZ4owofnzFLnjt+96njw5RG2Vwxo7UJ93A-42g@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	White Lewis <liu224806@gmail.com>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Mon, Mar 23, 2026 at 8:48=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 3/13/26 5:54 PM, Brian Masney wrote:
> > On Fri, Mar 06, 2026 at 06:27:20PM -0500, Brian Masney wrote:
> >> On Wed, Mar 4, 2026 at 10:08=E2=80=AFAM Pengyu Luo <mitltlatltl@gmail.=
com> wrote:
> >>> On Wed, Mar 4, 2026 at 10:50=E2=80=AFPM Brian Masney <bmasney@redhat.=
com> wrote:
> >>>> On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> >>>>> On 3/3/26 12:55 PM, Pengyu Luo wrote:
>
> [...]
>
> > Ignore my previous patch set. In my v6 that I just posted, I updated
> > clk-divider.c to support the new v2 clk negotiation logic. The
> > clk_regmap_div_ops uses this driver, so you shouldn't have to make any
> > code changes.
> >
> > Anyways, would someone from Qualcomm be willing to test this? The
> > procedure is fairly simple:
>
> Unfortunately, I don't think it's easy to get your hands on a 8280
> device with DSI.. maybe Pengyu could test that on his tablet/laptop.

It doesn't have to be an 8280 SoC. It could be any device that has the
issue where the parent rate change screws up that portion of the clock
tree, and crashes the device. This has been a long-standing issue in
the clk framework.  I know you recently posted a series for 5 other
SoCs with a similar change [1], so any of those other devices should
work as well.

[1] https://lore.kernel.org/linux-arm-msm/20260304-topic-dsi_byte_fixup-v1-=
0-b79b29f83176@oss.qualcomm.com/

The kunit tests in my clk scaling patch set demonstrate the issues
that I have worked on. For example, in my test scenario, I start with
a parent, and two children. The parent can do any rate. The two
children are simple dividers. This is the current behavior today:

        KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MH=
Z);
        KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MH=
Z);
        KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MH=
Z);

        ret =3D clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);

        /*
         * The last sibling rate change is the one that was successful, and
         * wins. The parent, and two children are all changed to 32 MHz.
         */
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 32 * HZ_PER_MH=
Z);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MH=
Z);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 32 * HZ_PER_MH=
Z);

With my changes, the clk framework will land on 96 MHz for the parent,
and 24 MHz and 32 MHz for the two children.

Anyways, it would be great if someone from Qualcomm would be willing
to help me test my changes on real hardware. If it requires code
changes to a specific clk provider, then I'm willing to also do that
work if someone can test for me. Getting confirmation that this is
fixed on real hardware will help to land my series that will provide a
solution to this problem that has existing in the clk framework since
it was introduced over 12 years ago.

Thanks,

Brian

