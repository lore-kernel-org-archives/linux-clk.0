Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDBA335579
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767615293; cv=none; b=K10+6iLQT6aepUqDvHEWCtFk5TutBg8U/rd4WQPGR9ehGdiO5El44NSFPSx41pzcINM3shsLsABG/yaf61Ff4OBdOw0x3J4b9ddST5by4tNRgvTVf6SH3jql9VOlq2fgkukFKP42VCniCSGCIwj0ODko5vgnVgMh8Y3kxn/uC14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767615293; c=relaxed/simple;
	bh=uKFtlxDPbtM+Fol0L4Q/FHhGcnWg7hf0UN7T6Y28eWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJLKj/bzvqbAYfJs8dXWi4lxtbhVDyLbhi1Hb86wIOnl7nzfiwgQ0OxfV8sAxEgwpwkcX7QTwpefnM5F/UrbZTcusko80khO3njxvYw1yc4QueKY7x9U5rvf6nq9DxL5nUzezPB9wHnQEL8NlfSwoT66ST3dKpyIMFWov58XHno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CL8esZY1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mZ4CW53w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CL8esZY1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mZ4CW53w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767615289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pALCUxgG0Sih3gS1zvT5EYeP9u7uxFAHJ/wplVNqgIA=;
	b=CL8esZY1GYAaPV/IZ7WsWlwGBj13y/IQcaqsIRArVMNb5/Q+NTkVPMf6qcDry5aokXap+e
	Qp3p7aLxStjtEwdF7suBn1LLJZHAcxe29ykATjuPh/UQWkCkZjh/RbkOKXgCNOGU26R51K
	fLMcj8qiKFH4EZ8ys6ngGpc5mZR7w5M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-OTEU3_CuMDmB5B7CAa9U1g-1; Mon, 05 Jan 2026 07:14:48 -0500
X-MC-Unique: OTEU3_CuMDmB5B7CAa9U1g-1
X-Mimecast-MFC-AGG-ID: OTEU3_CuMDmB5B7CAa9U1g_1767615287
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e19c8558so2052636785a.2
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 04:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767615287; x=1768220087; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pALCUxgG0Sih3gS1zvT5EYeP9u7uxFAHJ/wplVNqgIA=;
        b=mZ4CW53wTfnKI5AeQLayT1oXksYx1fIgiuiY7eXl5dlCLBqqZuKEt5N3RNjWWMKGk+
         CagOrOzonV/K2hlRxNBYB/a2pv/LB7OJU8y43vYQOe6l99hj9En2dGnsTFIpUTdZd0Uh
         8CHX37w6KRSqWh8H2CWUcN7VLUZVkWZ5kRWrBe1+tPNlum/LFwIlf1T8+QGmEZuIUtFa
         TgEQAvmCAkIo+KGlBeSWAk+0llqgWwe5wdSEROGioJc6m7QAanQb7CKUoUxmnvnT+xjN
         oSIcK0aPZikNIQkR7xxw2ynxhW4VWAH0ujyuIJaJGZ7RZ8sXQAB11GWnAg4xyE2u/dSb
         xLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615287; x=1768220087;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pALCUxgG0Sih3gS1zvT5EYeP9u7uxFAHJ/wplVNqgIA=;
        b=Vd9C32+zhy5UdAa56SqhiXpgfj9vpZzMFft0q5eRGDqI39whLhb1xlKVPT+prjWvL8
         LvLHGCuC+KJx4nuJE5kqVim9SzKhhgvqPZ2ila/nAndlfVLKr2BiTTjJn3ZpjLqW3CDo
         Gi4GjV9B02psY7jVseiCqh9pUz5rKGz5So5x+kXGThn+jAMTeYlybE5vGe4uRBjxE2LB
         9IcJACIBnXafqB5XLzv9FUgF5oTH8Jkl6lEX3SwcZs4zchZ5pwcBStVDd/GQ7e1LrQ80
         zLQSDc/1BL0w9MBfu8zFEzHinXc65+mkRUIPzw6OfRpvp3TU8gQBkf4vPn1U+CwDmXt1
         8uIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdBNLS3LiFowG59oztAhmWB1VLZIl1stsy7/4gV+ct1fLz9eQ1S/PzRCMz1rlgIqZOZVdnIR9caOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1W9P7qrhNPRRB3sRrnZ0Uo/tC3kl5lRWXQfjMJLky40ek147g
	PQ8ZL6ygB3QET/GSYNQKOxJyi5+rA21mQMUQKzLUYBzKVnR6xB0UW09I1+oMj2OyAD8q43Fo7Nu
	Rz9JQ1xx9FmzZG8aLgcLdmmcPGRvsBOz+jC0fvKmDHCg4Vf2QtC5/t+A0qQPybA==
X-Gm-Gg: AY/fxX4E6SwsznJEGKGzWG0Wj+NjqZlkoB/rtdI6Fpl3LCHpFYIV3LRa6iy9igDsLoA
	mwmzsQDw10gij1uFj0EKDv1zS+YGavOfqzNx6Bnnglro35XULgycbVj8DKIyXOQvsMKfz60BRSV
	6gQINJEbY6yKkG1OoiCawdMzrAuA9U+A7NqRuASvFfJlEsV9Pp1uWfe8BrJD4eqcWNXnlUCZvPr
	w49scQ7QiDWdK/6bIFjInmkWe1oyf/+xxLU8giQUnqCEcQZJvuDjOedR3nONgOaslV8WwZ4NhHK
	qVm3VdMYMuRE0YHD4qJSwp9yl81ZFEPtRqadgBd8XF2I4siSJq/sQ5kg6qV43pIAzc/GKwUxV5c
	yygW5Fg4ovA7brYSAJ7X2lyQmnHug6t20XvWFAKa15niV
X-Received: by 2002:a05:620a:44d5:b0:8b2:d6eb:8203 with SMTP id af79cd13be357-8c090501db3mr7123132585a.69.1767615287453;
        Mon, 05 Jan 2026 04:14:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFX37kzKtyI4pVa2B6zkJ45mbfVDYf5b4bq6gq1EC+G2OfHkde7TEgVCraCyU1NH7StTtKeCg==
X-Received: by 2002:a05:620a:44d5:b0:8b2:d6eb:8203 with SMTP id af79cd13be357-8c090501db3mr7123126885a.69.1767615286882;
        Mon, 05 Jan 2026 04:14:46 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0971ee247sm3701650785a.27.2026.01.05.04.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:14:45 -0800 (PST)
Date: Mon, 5 Jan 2026 07:14:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
Message-ID: <aVurM1XRqiYlzi1B@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
 <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
 <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Geert,

On Mon, Dec 29, 2025 at 11:18:52AM +0100, Geert Uytterhoeven wrote:
> Hi Brian,
> 
> On Fri, 12 Dec 2025 at 00:21, Brian Masney <bmasney@redhat.com> wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > on the cover letter of this series.
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> Thanks for your patch, which is now commit 27287e3b52b5954b ("phy:
> ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
> in phy/next
> 
> > --- a/drivers/phy/ti/phy-j721e-wiz.c
> > +++ b/drivers/phy/ti/phy-j721e-wiz.c
> > @@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
> >         return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
> >  }
> >
> > -static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> > -                                  unsigned long *prate)
> > +static int wiz_clk_div_determine_rate(struct clk_hw *hw,
> > +                                     struct clk_rate_request *req)
> >  {
> >         struct wiz_clk_divider *div = to_wiz_clk_div(hw);
> >
> > -       return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
> > +       req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> > +                                      div->table, 2, 0x0);
> 
> Is this correct?  divider_round_rate() can return a negative error code
> (from divider_ro_determine_rate()), which is not handled here?
> 
> Looks like several other users of divider_round_rate() use this
> same logic, and thus are affected, too.

Thanks for the review! You are correct that this is a bug.

I had planned once round_rate is removed from the clk core to post a
series to remove divider_round_rate() and divider_ro_round_rate() (plus
the _parent functions) since they call the corresponding determine_rate
functions. I'll bump that up on my todo list this week.

Brian

