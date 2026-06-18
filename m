Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB53428D8DA
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781801723; cv=none; b=Ym4/Is3TjWQa3daMz7JjLV09Xbg1VYReEsXloEa1yitzyiuomNLTj7exoqGtt7EYfo8oPbPAH1sF+Cs0aNkeiiXKlrZLbpdPaNcJHWP/krk1fpWUKSYunGa5+uoj2q4MuAFLc6bUCW+pCK0v6Z3eKdPD+5mPF2Ut65bnlHjKNk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781801723; c=relaxed/simple;
	bh=79IVbye30F+Vnt7rsHDjQEpcUSDMoq4tpqG/8F9B2RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nv7LY24XbkBOdlw/1xVQtUhL0eYVVYcesUK1HacdICnRW/7Irk3246yH3YRPtPI8XrT4OrjJNRxIG7fTDrkWWHJTJpNal0dZNbmqrG6HItU5X5vN6t8nPUTMLOpOr7IBdz6iR3ZdbZSlAMPtW4J5hVrl1+TYyoDsFLNbSie0rL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K2V7jx37; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ld2TWdr5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K2V7jx37";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ld2TWdr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781801720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QcJ+Ate3WbeMuQowiGRSjaZCxQdznzVYNSFAjINsR3Y=;
	b=K2V7jx37Efz09aoN3psYWwDVFFX4WUf73IJOS/ggGxhhc1xDPbPeJoYdvTp7j3MozIXC0N
	f2kHZUBtloSTngu85SIQRyLOBW2UaLLCWGmAQjrtAkhH6FIMOwiSrRRN7VOy4vzo/fK2o3
	UZDAgS3wLZgpCFE1eM5X1Yt8/iKXya0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-D0vcZeLKNTanqkP0NYuNDQ-1; Thu, 18 Jun 2026 12:55:19 -0400
X-MC-Unique: D0vcZeLKNTanqkP0NYuNDQ-1
X-Mimecast-MFC-AGG-ID: D0vcZeLKNTanqkP0NYuNDQ_1781801719
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91931144870so293511985a.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781801719; x=1782406519; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcJ+Ate3WbeMuQowiGRSjaZCxQdznzVYNSFAjINsR3Y=;
        b=ld2TWdr5P8oRDA7A8EcOWev05m3vIE29IngtTcJ+mx9ERLlCtNvaGqspBHOwq1IQbM
         KZRFTFX/Xz3coPJky5MMPkRTfUBckJ9diZCkvxZJoTk2OTr5vV6yI8eMAOs9KG82dngL
         VGvcUuZaTrxD/6E7qs8us7004wYd6WZafaNEh1o87eJHz2mWmFX623xR+qaWlKTLjB6P
         5SeNPuUD0H+oWmILDmW/bMf7hthyl//EZkKtpop7b8gxE9SYIcg8L6W9dPw65pBTXSkc
         easai/iedo+PFg0I3tvBu0tZe4qJPt522JGZONxDMvJbCKsDATOXmYbnXx4uAOrRcAXy
         yxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801719; x=1782406519;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QcJ+Ate3WbeMuQowiGRSjaZCxQdznzVYNSFAjINsR3Y=;
        b=krsQZrYIORbtuApIZSn29pQZhC3YjGXyYt2D3K9VOeAnxKQ0JyYmCTb5jTyEC5csEc
         rqUjozTYmox08hmkEKAn7q7ouNaG8QKLtmGKp5HyG/Cvk4bZypyYxOMnR2A2S7E8+73m
         WnrXii6ms7OPmCP6BHGeOPUwyM04kD6EIsWSxr8OsSg/bf+GWyUylXYmmhL8kXJsqqNW
         qTQKBNHyfqju8XVMhS/KHgEYZFuPsSHvOTSUDOdv9S8Yq6Y4mTAq4R/H5gF1u3Jr38Hc
         SSGi+6XvMdzdZKRs4aS9dp4EfOOeQoiSKLSOvSLmNEW5oQ+/RSUgWOZO8BNfdA0v1G3X
         AzJg==
X-Forwarded-Encrypted: i=1; AFNElJ/g4RcPBgH0o16x8h793G9acmllazc+dfwtnh+X2kqo+1ELZgVw22tekpS1XQlTA96YSNkcCevJAAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYnCWOJ2hJFEstbb92D0WY7Z+u8lkTYP5+jMMNrtp4hw3twFaH
	8hq/2ilose5PDuzrqQD+Y0a9VMchP5+/P1iuZBE/OcpMv+6S2cvC82/R7dUYOa5VktEQTpPvxUO
	rWiHyWzp1BdxPqXJtDmOGnJIVFdzaRs4quE5EJiNGJ/le6anLjzBMj4IN5gNxbQ==
X-Gm-Gg: AfdE7cm5y5NP0QsqOfyMQvCLvBm1BtJGNLAb4+qF0JFHupnpVNJo+cqYWc+sOfy8m3S
	93qqgwHC6EZZUIbnFfihJlIbKXE8dwHIf2m3jp2F5hIQvxQEU9lEqUxaqrRdJbSBuZLg5rog7NH
	Q6Jr8/X7gsFFuk1RlLjnGGFiMUiwBbRfdmEiuIW0W4qkcWCxI+brHFp9yM1bIevHzUwAnSdxZpr
	XARTYNWPKIdDOI6PW1PdIO/KnzQWGULHhOH2YR3SoEIv2/g0mTYs3D+jYvRwy/kNpQypVQ0CH58
	isoURDW+rkQeq8xqpORxVLza6kYxyV8n7BPQfTb4cbcoF5kHT6E6rPOZkxeUKrcxxFlbVD2YR4z
	UBXGvlok9vVnNnhMsP0FCZvxNkhimciGZaK48RUtkbLCqAA==
X-Received: by 2002:a05:620a:1995:b0:914:7b1e:a5db with SMTP id af79cd13be357-91db9e7d4bbmr1431456885a.4.1781801718973;
        Thu, 18 Jun 2026 09:55:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1995:b0:914:7b1e:a5db with SMTP id af79cd13be357-91db9e7d4bbmr1431447785a.4.1781801718263;
        Thu, 18 Jun 2026 09:55:18 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a0080a7sm2137505485a.26.2026.06.18.09.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:55:17 -0700 (PDT)
Date: Thu, 18 Jun 2026 12:55:15 -0400
From: Brian Masney <bmasney@redhat.com>
To: David Carlier <devnexen@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Xukai Wang <kingxukai@zohomail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: canaan: Clear rate fields before reprogramming
 dividers
Message-ID: <ajQi85kD1jVeqrQW@redhat.com>
References: <20260618045030.12581-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618045030.12581-1-devnexen@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Thu, Jun 18, 2026 at 05:50:30AM +0100, David Carlier wrote:
> The rate set_rate helpers perform a read-modify-write on the divider
> and multiplier registers but only ever OR the new value in, without
> first masking off the existing field. The first write after reset lands
> on a zeroed field and looks correct, but any later reprogramming leaves
> the old bits set: the field becomes the bitwise OR of the previous and
> new encodings, corrupting the divider or multiplier.
> 
> Mask off each field before writing the new value so reprogramming a
> clock to a different rate produces the intended register contents.
> 
> Fixes: a7b7c7c6c016 ("clk: canaan: Add clock driver for Canaan K230")
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

