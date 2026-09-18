Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6F54704D
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 22:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770479; cv=none; b=Y4Z7rifdsg7HYbH+8CjVnOTGXtrFhcN59FhM8/ku30yMFxXcUiTPdlehgY4x/asjqw3nxL98hwuPJjgUiB9eyiKKHHPKawwtO+BoZ//A5IEQ8NajEYm/QWFw6VDAI4nX7YDmu97KrfSfz3O1zML7Vw1iiWGU802TJJq6rOV9o5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770479; c=relaxed/simple;
	bh=NGIFwKB33NxQy+k068R4T5Tm6/ogvoilF+pwjImbnro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZD7k+cftDF9Co8sGHbTNQK6tE3Odnb37/rNBA0VbaJS4zckQLA+2LmbPQawRon6SInaB6krlUNWyqDTfQ4bFCQk2yAoxPK7W5KYC6hFoe53RpuyplXi77VOcXEDGBGcgK1GHjOE0u9UsfepTiBxS99kR2Kj5uJfHUP3dr0Rxpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KohRcIls; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UeJT1TBK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KohRcIls";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UeJT1TBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmUqK+rq52Mp671nbFhAqy/BcNTM6h9Cl3CLl+lByKU=;
	b=KohRcIlsj2Xw/mHhaFaC+4+1iyzZAV5REJigf2h1mlmAz+slLKoxpKQPPiU3Dz4OBibvnO
	d4BrHvIJXzqHweKyf/+Z/gIx32Gt2V4emBOx6RryLL3upf0KzrpK4IgleXz2SwDR8thYds
	kIBfpn0MxQ2xu+XDZ+lPSlt/9TixzXg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-DXwWTgq0NiKYpC8_Kp8PEw-1; Fri, 18 Sep 2026 18:27:55 -0400
X-MC-Unique: DXwWTgq0NiKYpC8_Kp8PEw-1
X-Mimecast-MFC-AGG-ID: DXwWTgq0NiKYpC8_Kp8PEw_1789770475
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530e5b709b1so25606141cf.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789770475; x=1790375275; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmUqK+rq52Mp671nbFhAqy/BcNTM6h9Cl3CLl+lByKU=;
        b=UeJT1TBKtDviuUFICtm1oioVac1IdX3VT6qTKrTwTCsG9E5M2e3Czm38oAntgzsT+q
         dkyOAyukQpgbpnhnl4Oz2XyWBb2mZhwKtjQSkCdHEJ5hOqNM2PYPhdCYHtKK6brQBWPl
         3wINOAng70nK5eUiQ5rh8fuRKvFK66FkErkOOaCLQ7FqY0U+CtQ6CUTUTEyJvx/1g1uM
         DuhWdlS3QuNVqENd5EeFaqI5Y6r/f20KYMdAHGYxhhLuygr4zX0oQ7Lc0laSMhUKNtwk
         0tJqF/DNbctVIRpGcJU5MlcYo8GoP2cCLAHqP80lwdQt45AgUOsiRXHcUghOfZAHlw7N
         GYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770475; x=1790375275;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YmUqK+rq52Mp671nbFhAqy/BcNTM6h9Cl3CLl+lByKU=;
        b=uswLBKnl9p1Sc+kwxNZie00yz9O8JpcaVKG+mtTubvswYN0gzPGPmDprgf/q8Wldp+
         3urcPmB5576buiTSKL45/mZ+RZLws1LsnxRkFeeTwNFL/zWo8CqqJN/otIcsdoJd2ax1
         JMF/kL+5BI6mhInmhmQ0Lu+Xhy9QQxXQZydmID5iP0DHQstqA1bcT7UaHZmb5ZuWCVdf
         1kV/zTxGJOjGx/AfUgAx1eDQItZ+KX65iroQ0Jmlhq93ZPfMOF/nHo4wWzPy0T5L0/6v
         xsx6Ka9vGtkc7LPKNZVsD4Kr0i5Zzvqlnu8o+sMdSGHj83464+FGbYygGGo+SuGLjdNB
         f8Cw==
X-Forwarded-Encrypted: i=1; AKwUvBw0hWQM3cwXklBx04g+ycB0jfqH0TpNTcoJ+k1iNu92egI2f7r4keAaJONhtnEbx0pbB710GWUVP3g=@vger.kernel.org
X-Gm-Message-State: AFuF++mNHgkRzj2l0OhSa4s+z3pHrTV7Hk3SUw0K5sb88VYEx9TjEtgJ
	H80h5RSK+upN3EIAZIeX1sqoYPsvSuVH0CQWUvkSj+rsgSViI1fdQFmbA0cr8vETWW+k2EQRD88
	ntywkj41I6HGb3xXY3M2cMWsYPmApvoCMBRydNy+FxrHyN0+Lv4EXzNij06WN2g==
X-Gm-Gg: AYBFou0ckbCOyz26IW/XAF+lDwL6LEmEV7IMaeGQ3rNtzD+eIUDNmOlQBil6/MqVzI/
	toNwDGBAXYSkUUG2PcQqQOhoWklv+4e71vd7SiUGQhzVMJDeaYPolRrnYtVxk25pDdj//AbrN0S
	xJFO+Eg1/h+KoZ3i9YmvDoM71IBfoObyk0ZZZtViq7c2mdC/tCEDROXE20ndKwOfLOKT6VrIm90
	zzjCx1xzeRWAplzmw+Ct+5Xsp3hqe5cH4eMDawzg3MCTR57xWPsupQTcizU6G6MJSlHyBtLkpRj
	XA3pHgOlFzDrU/2b/+XhYFeWoi6mlzvVHQee2unWjL2znVY5ttueYDZ8SMJZG/ubgWyZGXQ=
X-Received: by 2002:a05:622a:2616:b0:532:9ade:b6da with SMTP id d75a77b69052e-5329e557017mr77338901cf.67.1789770474804;
        Fri, 18 Sep 2026 15:27:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2616:b0:532:9ade:b6da with SMTP id d75a77b69052e-5329e557017mr77338571cf.67.1789770474435;
        Fri, 18 Sep 2026 15:27:54 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae750977sm7202701cf.23.2026.09.18.15.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:27:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:27:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: clk-icst: Fix node reference leak in
 of_syscon_icst_setup()
Message-ID: <aq266FMPwj99yVCz@redhat.com>
References: <20260915070103.1733176-1-vulab@iscas.ac.cn>
 <CAD++jLns9S7ba9G+wcnsfrDBjtDWbM-qzg+NeW9vHFHKcOz3NQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLns9S7ba9G+wcnsfrDBjtDWbM-qzg+NeW9vHFHKcOz3NQ@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Sep 16, 2026 at 07:25:39PM +0200, Linus Walleij wrote:
> On Tue, Sep 15, 2026 at 9:01 AM Wentao Liang <vulab@iscas.ac.cn> wrote:
> 
> > of_get_parent() takes a reference on the syscon parent node. The
> > reference is intentionally kept on the success path, but the error paths
> > return without dropping it, leaking the node reference. Release the
> > reference before returning on the error paths.
> >
> > Fixes: d430819d69a5 ("clk: versatile-icst: add device tree support")
> > Cc: stable@vger.kernel.org
> 
> Stable? Really? It's no big deal.

I'll pick this up but I'm going to drop the stable tag. It'll probably
end up there anyways with the Fixes tag.

Brian


> 
> > Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij

