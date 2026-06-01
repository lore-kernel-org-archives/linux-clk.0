Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6D3DC4C2
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327239; cv=none; b=QCTVPeGSJLCTArZPHTMEcMTgF9t6Lfv5CuvvTd+XmDTOtI7C0eW+rW7xiBoG2lgjN7vHs0OQPRln5bidbtksK+Lqi6CohzKiQ4wf2FGxCtFpcIu9RgqrD4yhPTkjcmejRNz3wOBohDt9PElp8acjkgelNFUeGmk5m37PI+KjgwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327239; c=relaxed/simple;
	bh=H7eBfx6lzkF+X/zCrOa74RZr6nUWFt/sqnIlZXjqRp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IT++txMMpDQ1aA++SPlxySojd7arnMQXPwP6z6rti7g7igEUa8Zr+2fqoaOnuW+FD5uJUI9qOqbIsBYkCtnEcwl4/4VPSB8f0ol/cqqIMJ9AgzbrSRmUracJ4FVLUdqwdH5+GygknOgDJCbFg22GfHr2F3UGN+/6vS1S9tNJ+RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cH5vfEdy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kVOW17Os; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cH5vfEdy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kVOW17Os"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780327236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YG9WjUJbD5swPb1xxJphH03w07XnwcgfExEp30NwV30=;
	b=cH5vfEdy0B1DeweEWoPkhCIUAS19bRVgDfJp/nmENys+V+upp+iwQw3uzkcKF/V0YlZFfD
	T1vhlwA1SlIa9JUl3eKXeu9NlndWzkUXpb2WYK8ljbiTO8NqLOwrJ8Y1tc+GAqc63xmPjT
	mDXCM1s/I5adeQR+eA6wZbvd9R372Vw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-LQ7QAj-7M9K32RXrsg6ygw-1; Mon, 01 Jun 2026 11:20:34 -0400
X-MC-Unique: LQ7QAj-7M9K32RXrsg6ygw-1
X-Mimecast-MFC-AGG-ID: LQ7QAj-7M9K32RXrsg6ygw_1780327234
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175bb9d47fso15468681cf.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 08:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780327234; x=1780932034; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG9WjUJbD5swPb1xxJphH03w07XnwcgfExEp30NwV30=;
        b=kVOW17Os/fVswvvRRoMWkFvPq1bI8Ls/Tia/vH0feuc4K71Pbf7c7CBewKdhFyCKAP
         V8bXj9FaEd5DmY6Zcq7nnnjHzr73VZ2aNXWoP8xZyOL5m/uVM0aCwWFs8MNYM8PrvWq/
         I3gZhl0xY7QfIemPlfF7BXPIBnRtp/SL+T1LrTjDzxHhBcjQXeOX1bHhLPe4D1AjOJJ7
         95jef/OucJfQFl2Pf20VqucTF/t4TgYsZXZtzNjGNqBYOU0qEXd1xZdo0snkw2ztQZcX
         9YwPEeNBRXtIHuQWMfbHBcSfHiFLp8vqZi3Vv0fwWiLnhidm/ZIJFsM+A6PbglmD607T
         LcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327234; x=1780932034;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YG9WjUJbD5swPb1xxJphH03w07XnwcgfExEp30NwV30=;
        b=H9QOvrSFr/D6MW6rNcmWzygvPDJCGegR/2SL9nRqXgwugVgEkqViNCz0Y/6dTC2A84
         eiFGox4oIRNz2nLFeUZG0m5GaFdymmAsiO7nugwRIo390avnnljeSY/wzYa3prS/s7JV
         yAv2AYxrE49iSlXMkeQeokcPrrv4SVFP/ilXnMTGD0fqOIew05UF1C9i2Qe/rssEYPZA
         3J2Z1hJjVs2Pb1vHDTIfBAOVTMrUpLJk0nYalBwjTL9E/tHSykv6ZIX6YjGNDaM+Uimp
         NyPrGDsU8ufJlnzO+ojJQwjA+J2bhQbMp7vkS1t07SXk4hmjCzG2xqYHoc876QwKXWyH
         ueLA==
X-Forwarded-Encrypted: i=1; AFNElJ+P0lMiMuLiuwxldnYV44xpZAuGI4BStPXc+GvTaunsALvtsrpjhO4olGcWsZb6AtKD0UEhgMEVREg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ82xXpDEGbGwAQT9eJnyIe+nFaEFyrgGuqTn3h6FkwWGdyUQQ
	WEZdzL6dDQhpc1fUcZ1ZRuXc67HE4M+zD6r7fZrvyttoQzfZAA07eccyJDj/s5iRwO9xM4F3qxt
	SOZH7DJ+Huua3RyQ96kphbuv7t5XPcSQjQIqBjhZW23/ZsU+1g7n4FhuNh+pTAQ==
X-Gm-Gg: Acq92OEXxcpUOue46w9UkIi9KLM+DHBT9zi6X/zzTvK6dyz1gQjftxn1ThFEjewk6Oq
	yzewevB0eE0IST6dYqT8IjJfHuwjIPStj1WVaDzvmwh8lcrhisgNg64Bo/CtvmZmUTyIaVQNPjc
	SUYtQtyEKY8hK/PYtOB6p/62pCAmocdUj38qOkTiMByQ59ZwC9q7b0ONNYF3ekxzUDmwORUHG5Y
	pZEnF6LcIQDV52UL2B0Ym4mkZibDfTCgt4fZ5xIdD8RtEkPzJN/o5bAo96541EbmdV4p+nIDoCW
	PRNWcVZVleTg3dBtBJ5b2VX2/CGSN3xBt8TMHXevha/a1tYfh/WV33LlzRt/4Loup/A2k5bVc7K
	0P2wxl3i+zUZ9sxkJugIJGpGTUyTYqt7XAXOmFYnSVFGfbKoDI/bKBBpUlCABJw3G5LI=
X-Received: by 2002:a05:622a:d0e:b0:516:e517:6dd3 with SMTP id d75a77b69052e-5173a851999mr140711461cf.40.1780327234153;
        Mon, 01 Jun 2026 08:20:34 -0700 (PDT)
X-Received: by 2002:a05:622a:d0e:b0:516:e517:6dd3 with SMTP id d75a77b69052e-5173a851999mr140709551cf.40.1780327232413;
        Mon, 01 Jun 2026 08:20:32 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b2df92sm58039471cf.9.2026.06.01.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:20:31 -0700 (PDT)
Date: Mon, 1 Jun 2026 11:20:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: at91: keep securam node alive while mapping it
Message-ID: <ah2jPV0IvbV6yQ6x@redhat.com>
References: <20260529042051.1626978-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529042051.1626978-1-dbgh9129@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 29, 2026 at 12:20:51AM -0400, Yuho Choi wrote:
> pmc_register_ops() gets an owned reference to the
> "atmel,sama5d2-securam" node with of_find_compatible_node().  The
> success path dropped that reference before passing the node to
> of_iomap(), leaving of_iomap() to consume a node pointer after the caller
> had released its reference.
> 
> Move of_node_put() after of_iomap() so the node remains referenced for
> the mapping operation.  The unavailable-node error path already releases
> the reference.
> 
> Fixes: 4d21be864092 ("clk: at91: pmc: execute suspend/resume only for backup mode")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

