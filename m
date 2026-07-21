Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07003C4B93
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 21:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669856; cv=none; b=H41cHM5d8T3jWWsKIy1tRLsngCGGENTVgWZokEX8HJItymqlyqWDZLsKSWvX+TPgs5ehJ55ZBvYiOE71zu+gtpXL+vKoSzOLeCF7Rs3MeMNlfDUP50v4m6er3c+o+uAEDEL6efRp9hrU8Bjgj/yE6aVQp0hSlYTRctFnC3sUuiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669856; c=relaxed/simple;
	bh=iqdfAZy+3oOh/UI1TI/qTjH5PnQoJRdqcbPxm4TA5SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GC10hMi+llz8Q2hLwxn4SHOYCfb5tA8CJ/FW/7EIkICM5uLo47LjmrUbLJ5vNTOSAcJv8W7zA556DfYRqgDXTa8wjcOFvAuJySyU7cROLaSGkZxTC7CH+V36A+eofyH9VKZqLQ7SvptkJxN21rUxLJPk6cUrd6nU8YkTO3LkSoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XWBiaNFd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K7Wli/dH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XWBiaNFd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K7Wli/dH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784669853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIZSVBhqogy00lMWUE0u3HfiwgLPEHiU/Hyjp8CM1Y4=;
	b=XWBiaNFd0CBxfW7thSCTnKmGQ/bg7ofJHegH7a9uQhYqUjJgzQrQAZ5nXn97CxIGkgl8j4
	EAXSmzGkZAcdXsxjLGw3KY4zCXyKbdUFduy83aecTRHuWhbsPBBrnOMfrYc8GrlwxZLE2K
	ZWRD1USI9TGc95KL+jQHUt+IiP3QSPE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-nLJtaB_MP3uikAxdeGofQQ-1; Tue, 21 Jul 2026 17:37:32 -0400
X-MC-Unique: nLJtaB_MP3uikAxdeGofQQ-1
X-Mimecast-MFC-AGG-ID: nLJtaB_MP3uikAxdeGofQQ_1784669851
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fc92c5373bso223927296d6.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 14:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784669851; x=1785274651; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DIZSVBhqogy00lMWUE0u3HfiwgLPEHiU/Hyjp8CM1Y4=;
        b=K7Wli/dHaHDJb8ihLgF7xvKHUiEiB3yKV+q/Fkf0GV0f/onDhnELHD2PwBicQKh49E
         g9gBK/CoyMRO6F6Ls7hR6rW51zwM8tQ3vo9c6CtdaCbSCkwQotZV7jRxNHayNRuQupX3
         9iyak3VffIIQqEvKqb56wZtJdg4XWojkotIBL59CpGDrPkU1daBp+Pxpk5HywacUFYrt
         +MonA8BsNcTovLU8B37ya1u8ItzJbvlKXI7YmWYPZytMYwroJu/hZzLigjXVTa1gn3p5
         7mGdzUnioZ7+9U5fnpvBmobeTYalsQcLut1bter5sZZaP2QLZTnWUXFxrBQEmjAmzgme
         19yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669851; x=1785274651;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIZSVBhqogy00lMWUE0u3HfiwgLPEHiU/Hyjp8CM1Y4=;
        b=NullfRP81AA6yAs/NStGs1CHeyqhEVQozIZLAo2VRZy4Qe4LdnhUDPongyiVoH0Z1Q
         A+zPaYYVa32bRxThCSFhOcD+HILYTEc+DHqWKf5pMPyeReiQQhRs+GmIFifeZSDUNWsF
         WCTIXSsLvnBswouzM0Sh2BisrlO26vgQdKWseT//mqEc+wUD3/hN3gXWCNea9hy0Wxm/
         0gTDt9g6jUwqs1FjEBJNSxZAdNX/HFvbfUU+g8HkbNBRJhAkj/u6C0ha7xHIG6++jhl1
         c860s5Fvt9iEVfT4PTobaqtc1B25U7rutlvYezZ4WPH6Ca1wzaIYjTDOFfxaA11rzCeK
         g3WA==
X-Gm-Message-State: AOJu0Yz9xb8My4prdNDyjHBJCiVfwHv8ZyKS3AF+GJartyW8ZUzrpZeg
	PHWe5BXSfymIPHWzuBC81rCgzlE4PHqz1SvsSUjadS4jwOYjCPb+EgFThFBu93Zgvhr9Cmv7+Sw
	WTNO1m4azjceKJLnUc3zRqRHgYWrschr0SZ+tqxHP5vZMwh5Fu+mdvn23EeeQ/Q==
X-Gm-Gg: AR+sD11wbT4+L6vT69U/UJrGjKwhMjknfO7tzhCRk1ICrrniFTIuQ3Iispx7VsscJcH
	ZtnQ6yRoK31UJ52eUm7XVfOinjse8cLiqZGahd9PZ8utkmxGYcg7s7CzLmS3cCXrydRclkS+PcK
	MDJeiLjXTz5Rance9pMUYneV9a9HI/02zqpmK6qbSpd6yopVp3ExASn7HV+6tGdB8oLrnAHVc5c
	sDvPydex7dhx16W70Mce9gBPCleWTcsMizHBTb/gsccirExW63oc9NjhZGTSLelVW3x4TxiCZrT
	fBBa/H2TR/CFC4jH4BaWFYX5ngBUh9rL3cGXczxcXWpqNq7FuhV6hSqZjM6pFS6Rg8O2fwnpU8c
	wlkt+eGZtDM5e6aODaiMrgCZgAMQ5mLOuOwU=
X-Received: by 2002:a05:6214:310a:b0:907:5613:96ba with SMTP id 6a1803df08f44-9077835424fmr221107146d6.1.1784669851542;
        Tue, 21 Jul 2026 14:37:31 -0700 (PDT)
X-Received: by 2002:a05:6214:310a:b0:907:5613:96ba with SMTP id 6a1803df08f44-9077835424fmr221106546d6.1.1784669850633;
        Tue, 21 Jul 2026 14:37:30 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b92c0sm5733876d6.6.2026.07.21.14.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:37:29 -0700 (PDT)
Date: Tue, 21 Jul 2026 17:37:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Lechner <david@lechnology.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] clk: davinci: add COMPILE_TEST support
Message-ID: <al_mmJOjo8zd_pRX@redhat.com>
References: <20260719214214.726826-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719214214.726826-1-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Jul 19, 2026 at 02:42:14PM -0700, Rosen Penev wrote:
> Add driver-scoped Kconfig symbols for the DaVinci clock drivers so they can
> be built through COMPILE_TEST without selecting the ARM DaVinci platform
> symbols.
> 
> Keep the existing ARM platform behavior by defaulting the new symbols from
> the corresponding ARCH_DAVINCI symbols, and use the new symbols for the
> davinci clock Makefile entries.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

