Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28418C8EB
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 23:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767916416; cv=none; b=rtcR5wyANSG6ZFYBPeofvw8elxPlwYi6A0aBJ/RYHgih6q54nxK0p8NBj6NSH7ygD8ZlJiAtap9J1BC4+wwA5QgavbrL9B8g0i3hgsH2z7Cjmf02R86oHqglY6a0sZwBC7+OQ/Z6fGknlKa0ldVa4i2Hh1W4DcHngjTrYmQuPeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767916416; c=relaxed/simple;
	bh=Ws5S9oazky2bBHe3gdkE4OmsYjXoHS0fZf2fCk0+CMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJu1YqhlCy8WRpgQcJsEwOHrUCkzRj0KcHZpCnbGQcFIiRi6vn5TQP8A+YXNEI0D0GOePXEnZyuAwfZi+/q2RGzyOIaPTlGNpLqYHg9pTIbjxzfhiynVYdTh0Di5NyqaeD2++PAELVv1WXbEshaAuE5xfE/8d26Q6Bl3ZUCRAhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WYFa59w0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BcO30Oa6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WYFa59w0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BcO30Oa6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767916414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvaLn6viyg9kXapGmyY93KyT45eozmIZAkWSd+113fM=;
	b=WYFa59w0oWHFxqNfgE/rJLPrIgW+5y93uXIHD81BS1mewoihkyIKiz1HTZmSUsJVuu/Fh9
	vJkmI6dGy2zrdPTVtre8iLAYfFOEKRNmyy0tiUpkJ7CSYD2rzMJDcsV6Rp8xqq6vHmh7JK
	5KhGFcXWIDz5p4U6H8bx7rYkDp3MbSo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-EkaJ79klNguROPR7Lmkfyg-1; Thu, 08 Jan 2026 18:53:33 -0500
X-MC-Unique: EkaJ79klNguROPR7Lmkfyg-1
X-Mimecast-MFC-AGG-ID: EkaJ79klNguROPR7Lmkfyg_1767916412
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22ab98226so680336985a.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 15:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767916412; x=1768521212; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvaLn6viyg9kXapGmyY93KyT45eozmIZAkWSd+113fM=;
        b=BcO30Oa68DA1G/5jgzSFADUuw5mSS898qN5tKmuwNbhnIKpy8ay4tDCcipZIcf9yj9
         U7YjQT6mROhz7T4JK3dQZytpB3txeSVgVsYw15HyE7JOvh8ZF01BpIq5BHuUGtzB3rFV
         /9Uad/kwTj4euLwn0QTJOkbCE8Hz7bCRawQM2tDQ83f5Y51wLhGg+NLrnp/LE5qWKexm
         HYUpoUBKe/bKyK70dSeDQaEQosh6KEmPZ47R/sUgyACcilrB2U6kd+pBML4yChkY8TXD
         gSeLV33k63EekvPBWEwf59BVX8vbP1KbyNRcgzJOsQbfxWGl7IyrDXtm2fkd1ypa4SHl
         9MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767916412; x=1768521212;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GvaLn6viyg9kXapGmyY93KyT45eozmIZAkWSd+113fM=;
        b=uD59uS8SqeujmFMpvVO+9bZQKvIM8TKGEbDvtGRTlf7KXwIlYC6a52gn4EoAi0YUOS
         EO/bATddpXc/FYaapNiPX9CRF6JxMj/l88+fzXNvasOXDk1e2brTz9hw8MB9Xo3co4bb
         bUXl3QpmCHy38qyD6iKojFAUApbAC4trZ4SATdTYVoLn+dOHqEMc2eSYWKyFLoMtMD/O
         C6fHb/khO6H2OGE9b7lTD21rPO5orfszmgWlh3ZlYsk8aD1XKOYQZXCTGf2RfLEevAzt
         B86H0xVLYxBr/7/Ngr/y0TXeZaPKUcaWwyMG8i4cKXu9Vitgwo1tcLchS46rgYD8Egbi
         q1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVms5GXKB799jJTXY0WysfpkuyTm4h8TLaveA9hYgbIF7/MxnYa84RTw3D3Ffpg+LQflzlXh6hJW7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1dsuWXgr7lCTsi4HcyycqqC1V69i6hQzhCglzsxsIHfCIXyOg
	01U0zz8Tr2K9Levq57P+kGH7VwoxnP4rK8OA4OKoIQ53i3WaDczqRvVl1MdtNCFXktbBVby0tQ0
	pl3SQMN2skzx/QeFdC5fIko1jBzPoyD1r8kprEzjJj8WEDxkkfXZCrrZrybzvoQ==
X-Gm-Gg: AY/fxX5YfmOh+fQEAv4VxgBJd2ujOETtpmbj6pYr27WC5Z4RmUZOpc4ICMsD/zo19PY
	k3E8XB9QfCbn3b3A8neCU4tcRw63F1mvsQ+xVo5gnVA9XHOEI5Q1z1+S4bVURJjXn0Sue22R7+w
	YRXZPo7R8qGMbLDZ0hvHH5btxtnvu3QEZ0dnrzLhDNH+ziOJB4ZMAJFNUt2ZPCFrHPGUnZBEbZ/
	Bfds02WUHcrcnkEudeXCn/JixL3YUQW7s58LzfT88jkz0GG1pwjegMRN82hrnF27A2ADWyJKdok
	xTfCUDqBy1W28YYWCMvMOg+JVtmh8y7t94c7mx6uUe7f4ff87apaCMDkphzjmRsSs7ELR7kAuVj
	4ELM7heI=
X-Received: by 2002:a05:620a:294a:b0:8b2:e638:7dce with SMTP id af79cd13be357-8c389419060mr1129791685a.75.1767916412577;
        Thu, 08 Jan 2026 15:53:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4aSIvh5903rUXtL5jEtQ1zOb6hKj/5LGmrWgk9wivP+NEURpK64IiEcwSkjpWLrpqPNhyVg==
X-Received: by 2002:a05:620a:294a:b0:8b2:e638:7dce with SMTP id af79cd13be357-8c389419060mr1129788885a.75.1767916412239;
        Thu, 08 Jan 2026 15:53:32 -0800 (PST)
Received: from redhat.com ([2600:382:850d:c75b:2aa0:b08c:d81b:f52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b8b21sm677303285a.16.2026.01.08.15.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 15:53:31 -0800 (PST)
Date: Thu, 8 Jan 2026 18:53:28 -0500
From: Brian Masney <bmasney@redhat.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, radhey.shyam.pandey@amd.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	sean.anderson@linux.dev, linux@armlinux.org.uk,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] clk: Add devm_clk_bulk_get_optional_enable()
 helper
Message-ID: <aWBDeO1KJ__eGa1M@redhat.com>
References: <20260102085454.3439195-1-suraj.gupta2@amd.com>
 <20260102085454.3439195-2-suraj.gupta2@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102085454.3439195-2-suraj.gupta2@amd.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 02, 2026 at 02:24:53PM +0530, Suraj Gupta wrote:
> Add a new managed clock framework helper function that combines getting
> optional bulk clocks and enabling them in a single operation.
> 
> The devm_clk_bulk_get_optional_enable() function simplifies the common
> pattern where drivers need to get optional bulk clocks, prepare and enable
> them, and have them automatically disabled/unprepared and freed when the
> device is unbound.
> 
> This new API follows the established pattern of
> devm_clk_bulk_get_all_enabled() and reduces boilerplate code in drivers
> that manage multiple optional clocks.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

