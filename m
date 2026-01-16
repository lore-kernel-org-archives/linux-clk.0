Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237BC225417
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578022; cv=none; b=Pxj/FQgkdN0Z3ZhQL8N96aSrXZq7gcqNWE+6orGqS+DoWpPRKAJSPp9zcyH4Si0gpV3i80rjzAAoY8UEYbT2IK+6DP8HFo2dXMBkFC+FwOnVPt6lRyMohxkPAO7r/ERrNopoHnZ1tmoOuHso3sQPxO2ANcfPxpWnUgagLxmzbFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578022; c=relaxed/simple;
	bh=cztxYVIqjL0oW7JOzUXBiK+cA4OYKlVjC85SzzUB6sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zz5g2fLdk213H6c9uypgdq/h3Zu5geieNazQARSXIztJCYfXqozIl2sGaxBfRItwqqHFLItRnZpx2RHPEXtw0r+cG5YJJgaFJeGyJZK81pmBnCFdWIXFEatPvGJ+Kx1eYN5axbLNJshpX84GfGB/rT909/VfBX3PbasHgHFTc8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LXuoiNOf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MkjzSjd0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LXuoiNOf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MkjzSjd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768578020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UrIyizG4iGXof9Dj2XjOXJtNOGOenafithbTMq20cmg=;
	b=LXuoiNOf+ZTTiv8H9tHzK8nBpnFZqLH7TjBvTWugAFz/ait66vfkP7TyX1HPlR01Kz8GbX
	87+Zx/H4gDPFfJzE4CP+bp9yx/3m5sV39dy+0zGufE0/fUyJxqJNOUqjVGtY2k8iEiXICA
	km/FyaDUw13/fp2538qSuePMibRnOUk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-jluwrwF5O6Gz-U5Ok9-_cA-1; Fri, 16 Jan 2026 10:40:19 -0500
X-MC-Unique: jluwrwF5O6Gz-U5Ok9-_cA-1
X-Mimecast-MFC-AGG-ID: jluwrwF5O6Gz-U5Ok9-_cA_1768578018
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-502a4aca949so32166391cf.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 07:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768578018; x=1769182818; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrIyizG4iGXof9Dj2XjOXJtNOGOenafithbTMq20cmg=;
        b=MkjzSjd0IQu8ZHjxpemwqBen+IultBEIWfEal90Y4279F0IZTXl5nbVdmOv1d2PSSX
         kqTbVxlDLe7azaKX350buazfX1/f469Id8o4l0Qr8j2fhPdiMhWrrvEkGHc3kcXQfTeo
         Oc5bwZG6gmqKLDUrmIDnHONW11GKzybC+BawDy3NzTkF/jfuzWvizC3IxUQyyDOe48qo
         k0s192PIl/MmldjsDHxg5OuZYJc3MAoy2pzWLqHrCoPnWRnI5oFcDpbOA33VseIeh491
         g65Kxn5dSBSyIRn9nkw24WnX9iXN2j6GMIK6vPpke6vYWdOhC+wwyCszDBYGwJLASByP
         Zflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768578018; x=1769182818;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrIyizG4iGXof9Dj2XjOXJtNOGOenafithbTMq20cmg=;
        b=cpwK/tRZuH0Z0jnQTUX+7QlNhwtEW/XUZITcbAoAtmkrhybC4mnAIXjBVZJBHT2zkS
         B5Y+tLyqYE0Ch2hnamy6PJJCFyKl8XcAqukT7UnovYoHuWfksZ2dmLo4DdGj7rS8SWhp
         vTAZTSMSQNFDkTraWNgXw/UTLimVuZB20Esz56CAy/rxkz9sBHuJqms8P3vIQ69VNTah
         ubZOkOqwnLtD1hGagFEx9MyV2W22fFhUuHJi7x3jOTLrWefqCbPVmsYh1IXGv9YUzc8R
         2ljP/2gBr3egL0sA6ZFKx5dreeGNN3B2+R62Bn3UFTrFjVfPahUsSJSC6dWCkWXLmdrZ
         VRjw==
X-Forwarded-Encrypted: i=1; AJvYcCVA4LFY16e6KOFXLfoHKta1fgkeU6CyFYsyUl4Y96CGbrEzaGZBTvb0OA4DiZr/P2IroRmyMcGXRfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5sTooja0rRHGKdeFme+S9/NqutNXKdDS7Slb1/zr3I2YWMZNe
	8REjr97cAk89I2kza8pTrJArXruo9l38Y9C/nIvDgL8txg5+Rbp3IytlPFc355FetA1WibGkJCt
	AD9Py2R1PFA4Snfhlrez3Rs7jrjPp7BKae8pj/iTLq7fQFogknzQSRhPAkO2MDGNGpvQKgQ==
X-Gm-Gg: AY/fxX4T8WPiLjQo5NsThNSLir1uZcHXop2sQ1YiE8h3FlB22YagoHFlxhgOVLmE+J0
	YpsBdBPiNwzpTXZl3PIgfy2KhU6GfTFoBOOs5quH8V7Z4zYbZAc9aG9rckVQlrhc2DI3S3OcafM
	qE0jDzXP3pk9looC53dwTbhKIOgNWgDPvZaRcj3vW30Vjw1I8BTLaUYthIgThAhhgB77hQPR37N
	elxnwiTEmK1zptlRVBie9wmLqDz+UM3z7PHLthKoDODWvNJQbhkv1Wh3VmHzTipD+FdHTLZ5Prx
	4FhRH6BoTXd/uA8POjqLfEqTY6eg3GYgESIFLYiqHByVY38A3FLYb8X1YoUUFwdqReV4Ynw2IjN
	4bl4T0LOfhgBjjO8yYWZzWZ/ZDgp+qOzSEnA5rexc0u5U
X-Received: by 2002:a05:622a:549:b0:4ff:c273:c1b6 with SMTP id d75a77b69052e-502a1fd897bmr42263171cf.83.1768578018574;
        Fri, 16 Jan 2026 07:40:18 -0800 (PST)
X-Received: by 2002:a05:622a:549:b0:4ff:c273:c1b6 with SMTP id d75a77b69052e-502a1fd897bmr42262711cf.83.1768578018022;
        Fri, 16 Jan 2026 07:40:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a725eb16sm250590885a.36.2026.01.16.07.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:40:17 -0800 (PST)
Date: Fri, 16 Jan 2026 10:40:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/7] clk: st: clkgen-pll: Add iounmap() in
 clkgen_c32_pll_setup()
Message-ID: <aWpb4KPmlTXqHZWU@redhat.com>
References: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
 <20260116113847.1827694-5-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116113847.1827694-5-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 16, 2026 at 07:38:44PM +0800, Haoxiang Li wrote:
> Add a iounmap() to release the memory allocated by
> clkgen_get_register_base() in error path.
> 
> Fixes: b9b8e614b580 ("clk: st: Support for PLLs inside ClockGenA(s)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

