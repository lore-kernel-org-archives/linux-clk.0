Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0B1448B8F
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247880; cv=none; b=FLClRcB6b9xeEx1AHdokFjl+C+2hU/42KCLBCwFVLJBTT3zvub1HW9hCScsHo7p/7GQUDJGnljPjGR0grcO8tWgTXpUZXhw6htDExLKEK+e69/3hsW8ojnicHfN42XZ1dnA8Lb4UyByQJ0Nul7x8R6xlj0+iJZrdzXw+SLgxSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247880; c=relaxed/simple;
	bh=APl65JmD8YB3Hl0jNbBtGEbN02P8z0BF9+HzMPWth80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwUHSC7OASp8pjpGXAMCGLElZVVw3Jx+J5w3zMUbpVbChknbEBLwGX6O4g+SumgS1hHhp2Yv0NfMf4Q02qQvW1Fx/8Pe/G/WmKkXcv/CdnryFV3L+KH0n4pyKrVNGvtOH8vuA8N5TRMCBfHgnwcms2/4QdGXQbwuJjuaFVP7B74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C0zfiDLY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qs9jw7nM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C0zfiDLY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qs9jw7nM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785247877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wdGSrg4lc9i4XaCQajX4CkNJu7rAnpQm8bC2lSUfnJA=;
	b=C0zfiDLYZkb2iw0Dk8yUMYfS0R504jdrTNjFy5AObs4JmJD2NeIi0mrEUsHBQHhhk6hsJs
	U9Zw5apQDI5AWQlpWeJrJxIn0KFHttmxFTrpCKSK7X43t9MjR2NeYGiBZ/O6BcLgt+3H2t
	Bj6Wh5N9S7WZ904k8GPdEVSUfWesLb0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-L5awTANWNfKbJCnJsJg6zw-1; Tue, 28 Jul 2026 10:11:14 -0400
X-MC-Unique: L5awTANWNfKbJCnJsJg6zw-1
X-Mimecast-MFC-AGG-ID: L5awTANWNfKbJCnJsJg6zw_1785247874
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so12662366d6.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785247874; x=1785852674; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wdGSrg4lc9i4XaCQajX4CkNJu7rAnpQm8bC2lSUfnJA=;
        b=Qs9jw7nMxKnqSf8dHBkaUXKiswhSry0Q4kASfj943uOd+vi6UNataHdYwhke8FjklT
         JlIaPQE7x7S77qG0aXaQP/rpQnO72CYxiuBrtch8y7ZfRinHtAe2dTGgazDih1CdjOzm
         xHYCSR3ZqmL0M0yK9UXALGTVFf6o4yQlXABn+kuVoUvL7ppzKiU8yjOrKNcjV3QWLxr1
         jTa30PG9+9FPPEdVruqoVYkzJPwmcjzjaNh6RU1Me2nqfPZFROcx9iV5XDDRCC1i/KFs
         KTn0rZRcrRvYzJWA5i1gyjrgsTH0d1AWtCqQcIPkkyKGVBGXkV3y0YCgzJzwzJCXyscE
         pFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247874; x=1785852674;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdGSrg4lc9i4XaCQajX4CkNJu7rAnpQm8bC2lSUfnJA=;
        b=CbIgbVG/OvRLwxO0xH/CWhQPDK8/J1f+r+7NBLjln4e6/ZkxXW9t+hTbWxY4GbArsa
         uNJFNrWvrqNg9483RRTH490dFCkXE0a7tcgtpT4+8rggsmoD+leL9bCWqEIgo1V/i12s
         z5O9eHaKn2xUF1I/yn+zQri4qxDw+zo7qBpLUFO5ISXDYSWpwDAV/DanPBf7itdQkG+p
         4MrIhphei7K08YSDKVauhd0qjHM4sSW55ebultSRRFLfAvF61PD5bW33ZslncyefT+Wn
         AAxwgo1NmgMQ59nbB3aFWh8jwGY26uIaWaUC5fpmdQHRNKIFZgOpTo2+oMV/cpGxyU/d
         6dtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp98NNUsnN6zgICuhmUUMbExRK3YsI93HABSeo5dhxVSrUTFA73fEGnS3wZxBWa4x4lQts8PPKWzv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU05F1p4Lt3NZYG70Ra6d0GpcaRC6j8fuQpbUDitq0CaP2n3rS
	xlzge7Jp0SS8sc20vaiQfdDrsyJXP5rIvWOaDPgKqIca5DUlqinaVLifR/aU1usUPoqnIJcIQGE
	GGp9h3/0ElgsIXdZ47Dm/sT0eW+CpgcBzC/q5QgInXpxB1moza8Gkqy8/WCGiuA==
X-Gm-Gg: AR+sD13L5bWLMYpm9b2YhBlbDBEykoDPB5u2g3VKh1lnUqLd1idbL3qxyGiKdWBSc+b
	opJvO/3CcKO29VHd23JamhXWMp7MJxN69Hgtyo7odS5YPAueDU8RyrSxwSorACjz2/r8L34OUcO
	qa340OOCSmt02AIU2R82gwQpk246uZZhZ9EG84gOU0J7HztchC3nRXKovWFnxcuMPCb5gSpUpBx
	etsqLygv1ITV1NpdVXTX+ske58hFcl5V+LvwZoeESy+5jl8VW0/k+toQ9bzw9EqhS66hXS6ONsJ
	c261Hqm6TTUrlFl7ZkeurAROx69JiWy/HQ7ioGKEalOa+FhINlcVUMUXNcMTZByWZxzo7uIpz1V
	VWdxer629/oj86tNIg4oMcwyLVPkvIWQN1Xg=
X-Received: by 2002:ac8:5fd4:0:b0:517:c699:3387 with SMTP id d75a77b69052e-529d7163a49mr20348301cf.37.1785247874024;
        Tue, 28 Jul 2026 07:11:14 -0700 (PDT)
X-Received: by 2002:ac8:5fd4:0:b0:517:c699:3387 with SMTP id d75a77b69052e-529d7163a49mr20347531cf.37.1785247873337;
        Tue, 28 Jul 2026 07:11:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dc4286dsm162646d6.7.2026.07.28.07.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:11:12 -0700 (PDT)
Date: Tue, 28 Jul 2026 10:11:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: ti: mux: resolve parent clocks by DT index,
 not by name
Message-ID: <ami4fLPMg9_p28Nm@redhat.com>
References: <20260727-mathieu-wdt-clock-theo-v2-0-c048a6394436@bootlin.com>
 <20260727-mathieu-wdt-clock-theo-v2-1-c048a6394436@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-mathieu-wdt-clock-theo-v2-1-c048a6394436@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Jul 27, 2026 at 09:41:40AM +0200, Mathieu Dubois-Briand wrote:
> Resolve parent clocks by their index into the device tree "clocks"
> property rather than matching names as strings. Name-based matching is
> fragile because a clock's "clock-output-names" value in its provider
> node can differ from the name used to reference it in a consumer node,
> and because names must be globally unique across all clock providers.
> 
> On AM335x, this caused broken clock trees where some clocks failed to
> enable because their parents could not be found.
> 
> Replace of_clk_parent_fill() with a clk_parent_data array that sets
> .index to the array position.
> 
> Fixes: ec7aa25fa483 ("ARM: dts: Use clock-output-names for am3")
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

