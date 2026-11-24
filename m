Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481292;
	b=Eh68KpA9XMIT9OLId1t/keAB5tRhE+STmiKa9JN41uH8tjYCE2fJV/JJtdhWDLwHO7f0
	 ZDJWoMQUp2nBMMQ25rhN1xQ74rU8l00hU1OCGtC0N0Ax5KjuJp+w/M64ptBoU3k5a78R3
	 7yC4lSc2TkBzMYCld4djzVKg7H83Y0tYfivKweLyNZn2B7E0swM+koRHO7IFpCgX2MKAq
	 ddF7u++7uyaAnrCt+p4HvrPQGLRBFjqSdcvj8Ur3BwqNNj77CrABPfrU4MUypcXGmMb9Z
	 fALPaRVq3w3rI1C1rlQPw+k+1L2YaLBKbrJpAUMvQqI6UAtT7TsUJtWgtNbNrUa6JJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481292;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=AL3M9vXZtiNj6K0OBpGxfbf8/UdIY/HNWl03x+2qoFc=;
	b=Ve0gLPHQ6vswyjej+THaB9wrCakiBm5TiJCvBppyyzjwfwWoDVWJ9+jCqAvcP5eZKD0w
	 WIo9QScuJw1dPkUqfSMGBYPR5jjyEC1ztRJk56NSKIrOklP0JgFzsPtgyB35cqPUSGT4k
	 Vvmdhdr2zgbmVjwWwKKrVWhXO53nfttmfpQeUEpBCHVvjN8/0nRzZ3TZFkginncvQvda5
	 pyuFxzYdZHgbmTBblD2Duj7fDg4hnb42re8CVXkLCjJuCPQzWtiNFlV8rT9Rd8s9TyB8F
	 wDOjPaHjK2ctGIw8cVS28vC2K3/HhKZFT58j9p+TzmVAkBpyNWPFuvll3yw4RkgZkFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WrJV2Izv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bVkV+8uh;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4F8606A321
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 00:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C4F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WrJV2Izv;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bVkV+8uh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795481291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AL3M9vXZtiNj6K0OBpGxfbf8/UdIY/HNWl03x+2qoFc=;
	b=WrJV2Izv+blRoSYwgr32e3kQCy0GHMk9mHp1MW0IbzjoRkEWkSGnj9aNSobaWMgwk8fh26
	gKKwl5A+KVxa/kuVmGSai2zwm9+hP1h2d5qocqf0D2H3Oth0TkX/e514vhecv23aNeyQII
	k0A4rOD7VplYV6oRxPxj4ATnuM6k/mA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-mN89HmKjOgO2BnR478kDXA-1; Tue, 24 Nov 2026 00:48:08 +0000
X-MC-Unique: mN89HmKjOgO2BnR478kDXA-1
X-Mimecast-MFC-AGG-ID: mN89HmKjOgO2BnR478kDXA_1795481288
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d2bde4c78so59823181cf.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 16:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795481288; x=1796086088; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AL3M9vXZtiNj6K0OBpGxfbf8/UdIY/HNWl03x+2qoFc=;
        b=bVkV+8uhhZ+Hij+qkhp9Hj2u/gOjKhvw6cnvyETmhNATeN+hqKGaEtVJ52ZW3uS5Nk
         sGgj/a/zIgDnaS7VTQl5R4DImOVIupAgMlthxiLjRbWet8uz344alzNZqIu1XDDRJgCU
         dRwgWtJ19XXchFjUqSiyfCwuTiF4cxv87fwoF+hpoLrV4dXviRknwLWA+XlMvPueHpH8
         M6E3XhQ3sR+budG1z4cexIUAOelmRXoI78CSf07PZrPoHHZG86tj2QozMF0/3wnpHWJ/
         27HhseFm1xNeLPRU5N/nCKZ3CgNDbmCLlbqTIu4+D/GIo0Pq4KYu/9BD0kvnTd2a+A9H
         9scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481288; x=1796086088;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AL3M9vXZtiNj6K0OBpGxfbf8/UdIY/HNWl03x+2qoFc=;
        b=AEfXBb9CrSXUa5YL8h2VyMYgQBel7Isn74YqpWMlTkAFmuwjHJGk8QHYxAQHVkl+PY
         9CeGXmIuv8MXdfm6bZPjr9+GacRlCmhpfior3Pi1O9T9EvmLsCxbK6jSF0EVeKyjB9/j
         bCUE216NihVF94ymVbT4gBcbVX0+/OkNh2+1vXQ/ybsgEqtuymMNZOy+94FS53LGLSAH
         aklkP+9avjgHcQUCGS4sTnTjuu1GijRDbG4PKsDxoJyjGm4W/cMHKxDqLDOkRETjG8Qd
         2tkElmW3oi1EeWdqv/W7IHcfc6O4aCCeVXHGwOWpTl00VeoQqrW/71ftABa1vxTFJ+uk
         Y5kw==
X-Forwarded-Encrypted: i=1; AL+hErF2yUaNGXm9anySquR+or0MD1upy72GUyTqOBfJs2McqliRMPCc/ilt2rgpLT/AGCHxr/YjBEt8LQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X8LbVviKDicSn7pVx4E57BJJmnDolnHJnfNO4E/02uKY0vh8B
	t0nnIDI95oLYf0ej3zxFuCTT/GlRfjPoK3P9AA8ahZGHVXUy48iMOZQMVdHyJ5v3MImXjlitQQ2
	zBRmRSHvpyA+7SQW4DNqYeKSE3XCWsf6zkKZ91ObyfudUdg1SkWdgpiPI3KPMcQ==
X-Gm-Gg: AZFdTZfyEAA+1GflwDe7HTkfGotA6fK4W8mGUuMB4Q4JnaoQwHXX9IkNpvVrUQQoH2L
	jJqNKXVSmVN3e1SDR+QDwpEuBeRuk+RNg23skzKTk+jssaVEx6C8x7hwzb8e+80CXNq42DxStd8
	9bhYobhAwwlwDvnb9pLMo0+Jx1g3OHBY3+wuJSGOIS15Y83+yBKO/dqXkvJi3l9T0Enr8UPNI6q
	wMuuGMW/p3jOIc9LLQYnV5KqfeVnMGflGTKtAvcldI10Kx2Pr+PhmCrBczkY63Ib0LXa3Lt0Rc2
	G53/ULzfGt4I1VTgRT/Vi3Nfh7FYrvD7k6PfqVAWDlCaC18EkJzkJDYwD5Eh/u5gtZZ85LXzOIF
	qrACOXO4TLMk5ZpExoSlUqH26Z2p5BYNItTVHtFTElYYD/QqeTE47RK1vif7gKNnLGTai8oUV7+
	Uw
X-Received: by 2002:ac8:5e53:0:b0:535:a5fb:645b with SMTP id d75a77b69052e-55d76aa5cdamr256006621cf.70.1795481288271;
        Mon, 23 Nov 2026 16:48:08 -0800 (PST)
X-Received: by 2002:ac8:5e53:0:b0:535:a5fb:645b with SMTP id d75a77b69052e-55d76aa5cdamr256006211cf.70.1795481287752;
        Mon, 23 Nov 2026 16:48:07 -0800 (PST)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e2c6sm114665611cf.12.2026.11.23.16.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:48:07 -0800 (PST)
Date: Mon, 23 Nov 2026 19:48:05 -0500
From: Brian Masney <bmasney@redhat.com>
To: Joshua Covington <joshuacov@gmail.com>
Cc: masneyb@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com, andrea.porta@suse.com,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: rp1: allow the clock provider to be probed again
Message-ID: <awTexVwV2Mu8u3lc@redhat.com>
References: <179545567027.246915.947299820828330388.b4-review@b4>
 <20261123233827.61587-1-joshuacov@gmail.com>
 <awTd1OGm3Munmah9@redhat.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awTd1OGm3Munmah9@redhat.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Mon, Nov 23, 2026 at 07:44:04PM -0500, Brian Masney wrote:
> On Mon, Nov 23, 2026 at 11:38:27PM +0000, Joshua Covington wrote:
> > I'll rebase on clk-next and send a series with your change, the tests
> > and the clk-rp1 patch. How would you like to be credited for the core
> > change? If you add your Signed-off-by, I'll keep you as the author;
> > otherwise I'll use Suggested-by.
> 
> Sure...
> 
> Signed-off-by: Brian Masney <masneyb@kernel.org>
> 
> If you end up changing the core patch more, then feel free to take over
> authorship of the patch, and just list me as Co-developed-by.

Also that's going to need a commit message, and some code changes, so
feel free to add yourself as well with Co-developed-by if you end up
listing me as the author.

Brian

