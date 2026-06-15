Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FAE407576
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541750; cv=none; b=oy9FBQqp+wivcr1FzDmFv3WIfCxpztcWksuywcuaCZqm7jA7UU/aiEEW6wf4TEkt6BS+Bza/u0nNls3Z+mYqLGuaz157zSrTbY2SftyaLic8V1B6ng6fcvDjlgmMCZY6yWbzpULGLU60MO0pF40n9+PwBLJTh5+R2gq+EY/HgGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541750; c=relaxed/simple;
	bh=AgPSODbDd4zTbYSk1CYuNaeRbbg+I1fKKrMAmetN37g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCnw0ZRBwWS6tAtoh6zwVXihfBmxm4RYr5y2TTV7lJiigzjJhyCHytgR2HOdl8PuVW7W6Q5E5bmYrUw1GAmcpBCE9OgcjXYyiI6zO462D+RI0EUltbjnUMOybZdCD1KzUyO8H10SJyvxNRJVn9uE21uIE3ZWgFUvQrDrK/hmf2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dcFr3WEB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jEHegoMT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dcFr3WEB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jEHegoMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781541748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jg3eKHm2/9+Dr+shG2gUZ2/D9yHklfF8q59PVSPRCGM=;
	b=dcFr3WEBMZm5TRZMdzoJmI3zgLU3eoxW5Qc3fD1Gj/yj9n8M2sdpUGu4e3Rx2n+dPOAO/g
	3M0Zzv/eyBqhZzNgSo9xQE+0TshS274NH3gr6GbaZHgVpoMFCW47ndt7OXXKDX8gW3nNGy
	i3dX8XtAaUds+o9PhHxgrnUfL+ZOHic=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-xVFEnDw7OxOe_wO_vYcN_A-1; Mon, 15 Jun 2026 12:42:27 -0400
X-MC-Unique: xVFEnDw7OxOe_wO_vYcN_A-1
X-Mimecast-MFC-AGG-ID: xVFEnDw7OxOe_wO_vYcN_A_1781541747
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5179e5ba14cso42252061cf.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781541747; x=1782146547; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg3eKHm2/9+Dr+shG2gUZ2/D9yHklfF8q59PVSPRCGM=;
        b=jEHegoMTQtQw+1c+SEYcOqO54wsR5EaNQMIC82+yPB/6RD2aaHyHWyuuB3isWECLpK
         Ib/mmlfOnLtOivJeZ4KBh+H7KP6S9rjfRKWkoFyagVLwlAiH7gxt5VFkf7fig6rwJbGr
         fcUhleMi42sr3xQGR2jd4NKVRjnde65JV84/U8AXucy6v2/doi2TBTtOOoguod2IZvR8
         aEt4tJEJ/SdFw9Ljt2wpu66jqIAlJfP/HLNoifo8KSis9BS1Kjq62jf9dzIErm1tXT+L
         GG8KZ0k0VRzl5xdJytCNZpVhpyCj1f3lj/FCP2k3rBzJBVJyqJn1/N/FScFadhTdxmTo
         Xd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541747; x=1782146547;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jg3eKHm2/9+Dr+shG2gUZ2/D9yHklfF8q59PVSPRCGM=;
        b=oZ51vwZco0hNKpk/pmL4h0uRkLp0jGZTzuOhMLDxRuGGYjl2/2/0DNpc7hGDK0BIxW
         ekI19SpawLjfvkbHVGTsZWCY8nh9q2cv/+6zZw4R8mgr5lMid2TchHw9ttU5OWnKysIJ
         H1BkeTKnTlWURFd5ild6pvxYpuDQlDgKnlxGuclpwjLPqjLanQwcj0dKp4m2Kfjl5r65
         cJM4Y7ZFAIlZx/UK5h+RO43L9Y8uD5ayk9df2QN315duM52avE4p0zhPsUru4WfGDf9e
         xRj8LEApgrvJ6onv0JSPfby0zRnKfYAfMpK1rjEBiNbnWYpczVVVwqgl64KtM5asuiVT
         1ung==
X-Forwarded-Encrypted: i=1; AFNElJ/pc/uRTm6cVTbkiIIsJHx9kWE6whYtVH5LMEtmgV2ZyrR7EbcenV2A7G7Pl9E+0VlYKfSUQCmzIK0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rlrcYT+Da1x4JyoCzgZbnz87DT4juoW37uUlaEqvLoo375ew
	wKIaNUP2dElTM3+A78zQPfE5yyH29Bs+GQ3NS9Xq08YD0GuzLpxv15XyYDR6ISrz5GIfKIzYw5+
	aIHFSuj6fq2CkJRmdfY3c17nX0ymD0Bw/fqdodTU9Ir5OlvDvOVmv1YKFsbdWQw==
X-Gm-Gg: Acq92OH5XjT0/QywwJYPg7NIRsls38Dee7nEsIx4SxVn05S+Yf8DZpMiuLOQvSMvkQk
	PlryBqEYscqJZrbxyAbEAhDa2zTb1jssAsllKcGti/pGtr1+XxM5hGJS83UHcqxEa2n45LH8U6T
	FOj/UqwkRl3ic4i/sncGNq00pLVGRSSMKPDl01YW09SFEiW1GlMc3bTjI8ZoxEKVoNS4cxFpqV+
	RrWp+44m48RreP8+rpt8/PkE5AuCIxn2uk9VxLCBo+TSIhqGnUkiidJmXrQK1/Ju1HhtfVx0jaa
	vMwL53KTw/7jG7fO6O0CFkFP3eD+oRCARJ46sM32PBfugiltGUGZGBDkOW8W+BRE/9xsOj2hWop
	NGrNpSp2gCt8Dw6n0CS3cIkzMoHJ8tm+8GHnXfatfCX3gEhJ+WGIeHz7Q
X-Received: by 2002:ac8:7d89:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-517fe603999mr208597441cf.44.1781541746693;
        Mon, 15 Jun 2026 09:42:26 -0700 (PDT)
X-Received: by 2002:ac8:7d89:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-517fe603999mr208596931cf.44.1781541746125;
        Mon, 15 Jun 2026 09:42:26 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7dad16sm112174511cf.21.2026.06.15.09.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:42:25 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:42:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: at91: Read "reg" with helper
Message-ID: <ajArb4D9OjinLmBE@redhat.com>
References: <20260612215251.1888345-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612215251.1888345-1-robh@kernel.org>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, Jun 12, 2026 at 04:52:51PM -0500, Rob Herring (Arm) wrote:
> The "reg" property is an address-sized DT cell property. The AT91
> compat clock parser only uses a small bus id from it, but reading it
> with the u8 helper does not match the property encoding.
> 
> Use of_property_read_reg() so the code goes through the helper for
> "reg" properties, then keep the existing range check before passing
> the bus id to the clock registration code.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

