Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BA62C1584
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139560; cv=pass; b=LyPVt5YuEKPUeS7QXvvvp1N8ORkzbNcNy3petiXB8Vf+0Ugv+H0gbr001mIJEJD2DmVAZ7h9Ln62hH4KqqQr5MpBDYpeA+7uiffzyoVgLUczIALE0CxngNnMw2v9+4+G5ZYJbhDwsywzu/Hq0KOZKrpkXws+RQQJcaC6iXRAUjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139560; c=relaxed/simple;
	bh=w3fTzJN8+V6jghxv1M/H15ZDVuy2F3N7AO/+lMqYKOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWrps4WldhMVULAz2KqaGwGNzo1K7+cQzl7mJKx2aujc2kg+HK8kmaXDw/yoQMY8Rl69JRwoLr74GfqNn810ZYdCmirwl3lf5nGw2V8VqNDEC1yjKVN0Gii9UUyPxRSqlsoYAwZihZBR7FGYHt15pQKTJgBQpb30s+jtythCmRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N1Ld3ROi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mAth4L+J; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N1Ld3ROi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mAth4L+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782139558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsoVvLn791YubaqDSSa6hQg3ul3SUZdB3qjVftDi+NM=;
	b=N1Ld3ROicGI4lFAfKKSVu6LOvUU/TDimpgLvts9jQJCCcWcL6niVfJr4E0yDJP48W6gApr
	OLwS5MuWFRD3wOgrM2BbAvMzAuzOA7t/rAIYJp3exe/uEaqSqnfzuc8cWE68dyS2C0FFFT
	un1EYvUjFiA5unDCzlxWxcg17j/Cf9o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-GjbnTouqMb63SGdWIwmsoA-1; Mon, 22 Jun 2026 10:45:56 -0400
X-MC-Unique: GjbnTouqMb63SGdWIwmsoA-1
X-Mimecast-MFC-AGG-ID: GjbnTouqMb63SGdWIwmsoA_1782139556
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-69595d7933fso4902040a12.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 07:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782139555; cv=none;
        d=google.com; s=arc-20240605;
        b=e7qytHtZwWXJIqmw0cHjq9WbflHUy4+TgIje1J7LzrXOY0Tpe4ArtWAHZ184zPo7YJ
         SbG1XDI6QfU0j5BfMRgiGO0fXiptlNKps8H6sOj6nZTbe5jtrsv6mH3iCKnr57Mkhpqh
         4okWRVEJ2VBGNg8epWBrj9rB4TIdhiVc8eryyiQLKDkBQAfZu/SuRT1oEnwKHgc8b8vc
         W95CoImvp0xdmy9OqzoPFBdo5sO/yYrzGGDO81QJa7HdCxSO38IhzDcOjamE2QyW9lNc
         S336b1Iuf0uyevG5FOdCh7VxUc2JHzipoYmIlIoPVFsW3gUBB6DJr1V+/+NFXCosljaN
         AGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wsoVvLn791YubaqDSSa6hQg3ul3SUZdB3qjVftDi+NM=;
        fh=IH5G0X4+i6wbR0vh/dc2gT4XglBN99gUyCqBq16K2I4=;
        b=iyxe4Bcd+N5Lppanxdlf9g526crsvYiPSJdzuxI8QwRUafLhNiwYu9plBNgtYndXbi
         87FIRdSOr17xSzQA5QXpRbXMN67GxPr5K+yYMW3FdfRLdXarDFsvGJ9gTFhaFNnuEWpy
         shriW8l2M6cqz9NLDHMknYO61p1kaIPnGYjonMSk6oolgJcr4wsaCi1u674l73I/UuoB
         dsaS0TYvXjHgVXgAA501GCTA4xwwg+mjVJgcUZafQWgGS1kR1qYukylWXj9tsFMbnt33
         yDZPDBxmFzaWhi5UbsIKcklRkZx2UhXR6FcsnIcsGvDsCmAq0rfEcbJQmSFL5GBJ2AHt
         g/Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782139555; x=1782744355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsoVvLn791YubaqDSSa6hQg3ul3SUZdB3qjVftDi+NM=;
        b=mAth4L+JiRgdlFGxRmG5GW3Fj/PHp0gNDps6/oHsRZ1Wj7EtECxs48koNuGrUTSZTx
         jYN7p5UKDCZWh/byYiOgxOHaeRIV9RkN8sdJDJ8ad9tfhQU29OXHXXeHGItTAmzg0QMw
         ChRAGvxs4bIn6X+JnsH4w5HUeTHk1rEtyN8IL22ECNMO7mWcc814goXLioThZCmZwpHF
         MZwQRrnpy4PhWHbVRlzeWDUuBU8qrGElxRu1hzzhMEV3bIgDEwIggi/R8r/CcYqCQqim
         11q4y7FsB5677ccfZ6mbEeuvR4uHhUNUxnxfGIwCKuVmrHLPy/RPt9G34phSrlpAVR/q
         8AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139555; x=1782744355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wsoVvLn791YubaqDSSa6hQg3ul3SUZdB3qjVftDi+NM=;
        b=PB6pDYpP42BNwX6Olrz/k62h33SK0HujE51k85XXl15nMVD1B37kf7P79iNyxNjI4a
         qwrVDIxduCxeM6Vkd6SxMWjlhDKIFsTUyc/ZeZJyEMefmdQyNwse6Djet5+MX7HDDPQr
         GOc3Kj10a2g2lrj1VwocGIy9CO2VAjB/J0cKbVFQGPoqZfzTKnsAI8gPuFvcAvz7FBmy
         452KNZC1Vt9C1l6qlIOSY6DWEuxSqiuzzWGDf/jywnhbYy2HMhPD3aQdWJWIdP5J2ezE
         mftEcA0/s5EScTHGeJybkJDgPpextRzDNa3Lzl0qGvaYgtB2KbLf3hHlSN6orkUVw5xs
         haHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+40yXqibBIdc6zyyqAEuxjVx68NePprCoOYUOhSwGbpo+rP7MZLIxs2LBLS7lNwD5FGCgUhKfwsYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDvyuhFvzhhDyuh1Rev4SzTijyZNLirn2lgAgYh4QYtexLvFnW
	KoyL5xIjppANQwsCNamZ+nfQ8OPnpjna07E1Chw97rZlsLw5xuq0DNJO5l2iOUNiFj7oUFl308z
	ArQbHD5b20buS1cf8oQCdTbZ+dPAc2uDBbJEZdFSGi3C53MNnNz2FJf6DiJJT6NjXfl05cM3vCO
	5pTYqoUR9S7UBsq4ODtbvn42CEXZuB/JQpm5qh
X-Gm-Gg: AfdE7cndVkwyjvcn2oClRBiTC0+QKnn/QHqo3UEH7gQQDpcsg2nwfVC8f5lXwqQxUPb
	DogVImOYyN8wgYlZ2Qvp8ZWWI7bh5WOXfp8fGlPqTgK+0ziwy2k17BD6BSeBgio4lRyygKaD81L
	THDm4yNeQU50FFO3hPOHIfy7JkqlqH+Z2OaBWNFIuoMTEuGzXguSMPp+q4swbXf1uWQFg=
X-Received: by 2002:a17:907:d84b:b0:bed:f8a3:23a0 with SMTP id a640c23a62f3a-c09b9681321mr579183666b.25.1782139554015;
        Mon, 22 Jun 2026 07:45:54 -0700 (PDT)
X-Received: by 2002:a17:907:d84b:b0:bed:f8a3:23a0 with SMTP id
 a640c23a62f3a-c09b9681321mr579173366b.25.1782139552037; Mon, 22 Jun 2026
 07:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com> <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
 <ajK29WcueJ1wLCLQ@redhat.com> <CAPx+jO-tHYUa5oYEjuCdgF440viiR=Q6O-X6q=JNGwLgS_stsA@mail.gmail.com>
 <ajRfSbkAYusH5H9H@redhat.com> <4d25f656-1372-4ddb-9e52-8f381700abed@oss.qualcomm.com>
In-Reply-To: <4d25f656-1372-4ddb-9e52-8f381700abed@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 22 Jun 2026 10:45:40 -0400
X-Gm-Features: AVVi8Ce1-J6LDKN2KknD7FF-dHwgiaeENbfRoipsV0ONHSsZwj0DjQd9ngtULlA
Message-ID: <CABx5tqKHLz3XqMcmf071woGy0KKcdU1e-BaOKyP+XKcvq0LeZA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: implement sync_state support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bjorn Andersson <andersson@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 6:35=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 6/18/26 11:12 PM, Brian Masney wrote:
> > I am not aware of any clks setup that way but that's not to say they do=
n't
> > exist. Stephen, and/or some of the folks from QC would know better.
>
> I'm not sure I'm following, but we do have this bit
>
> qcom_cc_probe()
>  -> qcom_cc_really_probe()
>     -> gdsc_register()
>       -> of_genpd_add_provider_onecell()
>         -> dev_set_drv_sync_state()
>
> and this patch calls dev_set_drv_sync_state() again in __clk_register()

This is what Ulf brought up. In my next version of this series, I am
going to change it so that we can add to the sync_state callbacks.

Brian

