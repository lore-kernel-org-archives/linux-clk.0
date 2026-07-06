Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912BB430CD1
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352146; cv=none; b=qVum8EjuAEUZc8/VkYQUxutDXvpBEfnX/s/NThJSK/kL9jBv8lj29OBtt/4IcOwPuGWHxl3jUoA0YtrIy81Vw8F5UB2pBxnAIVuJ/rImrMdb/pzryFbzuihgNB595yC8DRedw8rH+j/HyRK1v1Fz/cWN2hLxZDbUXlGhMYPAMBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352146; c=relaxed/simple;
	bh=xO0/XB277pn9nTvMGKJYoCrpd24IqBDMNjSujBba5a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEk4ZmbMpb0XxHbFv1tZSChpp/Yb9bw/pgT0yeY1RrzJh6gZNh/LJh7gra1fdOWfD4iMx6ui+rAOfWB6Sfhvewfi36kpaO+PnGKUPGlZKT3Y7eikxHNZUjcvCRkXuWFKlMQZ5qfPqUbaK45/Vsy0qlWNgx7R+8rDLUmmmnVmVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DZxlZUmZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gVRbvBxw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DZxlZUmZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gVRbvBxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nz9V1Z40aZ9Pp49Pl4b5IYoI16Na9eREnr92Rd6P67k=;
	b=DZxlZUmZk3DmiuEfFn49LEiftGJe8/WG+Exez1/TQgXfl0/LKelFO7rlxhdca8h1zRqglP
	btjmOuNAtltSU4QaaC4msHDH7z34WbzqxSGW70HHygSpvGYkWCbbABLKp1KCXZ92f7kkKH
	tVBA7AyqMg8vvOwpNGNPdhn9debV2a8=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-erbHcm5YP2-Q7pNPddWVqA-1; Mon, 06 Jul 2026 11:35:41 -0400
X-MC-Unique: erbHcm5YP2-Q7pNPddWVqA-1
X-Mimecast-MFC-AGG-ID: erbHcm5YP2-Q7pNPddWVqA_1783352141
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-808a9e5182bso92353337b3.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783352141; x=1783956941; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nz9V1Z40aZ9Pp49Pl4b5IYoI16Na9eREnr92Rd6P67k=;
        b=gVRbvBxwiGW8E7WjNPjyQ8DT3SMHeWTYlUiWW0FecLVJo8CDKcz03rW3XImcZwz2rN
         gmq7NkJzdjaWqDbBIUmDLANldUMRifCgctD56GDgDoo18sF76+CI+Alm4eb5lUcBSgZ9
         pFEOyWAWspfCJpV3y4xAMlOe5nOkdTu/UDmQqI/6+k3+dtXxpTTjXrqtQpnGCrqTkPOT
         rFwpnMb2+bjy18myXzBG5htB0uQYV6xX9TADjsxBlXBKXEGEyrRhIjNsR/WFg4mYTjzf
         iHuchGrVrZqYJuzgKmLjTbzXECzcp6FG/XBVOK5s9N8Ro/8FQoJkUXM2+Mugdq2ghBy2
         w8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352141; x=1783956941;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz9V1Z40aZ9Pp49Pl4b5IYoI16Na9eREnr92Rd6P67k=;
        b=SXLQacpXmp+yFWLbxUWORzHIQvhYGfHVpic2rDu4CH9i7hzwE/OXWQElZEb/Htikj4
         U8ctYt17//D3w5+IUKEtla0D4X95UTxPOV0pPuQpb7y1+i/TzQY2D3VIWeGUKnrlGtRl
         mlbpHsp91vL0FpvgCidM//xg2wOKT3/wY+4oUTvmS6PUdKdoCndxWG/0CIrMGr4CBENa
         jMgNtDlo/s7SN9Z5UXq/t76TU5n59JLlQC/tTGCcUxyk0DAfAHRQ6JoNDEkqR/Ksm6fO
         pn068geLaxuu8GlUbLcOBJ1JilCreZvDvbnyW0WYC8HOgM/h2hGFDUH5lvQh5rwY1DyF
         Sl8Q==
X-Forwarded-Encrypted: i=1; AHgh+RoVF17y67UHsVtIHf7x22079VCYpxGW8wxaJuiN/I1Ar8p6AdOuBU57njCcfk7jZqZmAqKYmGofzgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRrQI0h66XLLTUSXQLgbmPaOxVU5I5cfnMWBdcyy4HNhptmG/3
	kFrKjWWSMicRaPd/pa6RJ8+u8OHgrlx1bv8w+D6nLtL3jvfqS9MdTOj/oFUyxNirmbZleebdyUN
	CQ05iLwdfRYTYejS1MR9+BvH+EDpnmxnEtYi2+IsftJSl356iWuOk3HveNNXVEw==
X-Gm-Gg: AfdE7ckMAyci2ZrRrN7vEzEdfQHFvqJce4ePdrgzWZZfhxJr+mZwMhJITd1kd2KFQox
	818q12S05fhq0V6HQSXn9e196y43TccakakWdJjGPppD6/6qDC9Agly10Vljn3Eq5H2MEnW++OQ
	b8m2PzF32STYagC7WGc7hLOR8sldfx1U4vSgKoStERhuJigm0ODsDcd+5g7XeplIghWoPMbmla2
	RrliApcI59yxrFubVcjyeZ/303+fNCOd2gWzWN/4wdcirpcySPVUO1Zl9wz7JdjR6/ijLIFqtLP
	wtROQbFZ8SZKxEnbTnZu2e51enFKmq+qsFDZ8tw5oLmCDdhyaqbDuXyOZeirdGjRnmpJv3xOmg5
	6mtpgmL3q5aDXaRjMAJbseJ3AFl3M3/SpJKXOV1PoibrXsA==
X-Received: by 2002:a05:690c:3601:b0:80c:85e5:8759 with SMTP id 00721157ae682-81be38b8fe5mr5792557b3.66.1783352140777;
        Mon, 06 Jul 2026 08:35:40 -0700 (PDT)
X-Received: by 2002:a05:690c:3601:b0:80c:85e5:8759 with SMTP id 00721157ae682-81be38b8fe5mr5792387b3.66.1783352140419;
        Mon, 06 Jul 2026 08:35:40 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144783fa21sm58952937b3.2.2026.07.06.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:35:38 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:35:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: mt6735-vdecsys: add missing
 MODULE_DEVICE_TABLE()
Message-ID: <akvLSe4WOXpxgbO3@redhat.com>
References: <20260704124450.11035-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704124450.11035-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Sat, Jul 04, 2026 at 08:44:50PM +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

