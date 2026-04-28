Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E1D1862A
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408426; cv=none; b=l2PhkgZ/sYFn8660+fLbpykEsJZ8IjcyRDIFEuMIeZb8UJjAIk8/9rVMRfslrKSoscQFGRgZF/ffqLSTg4gl5lABNeJNgDyfHVq1BFSoYpqSt9csymG+NJgAvO6/BdBeZ3OhsLimCzt9hP9cJLhY0etLRx3VWgb0YnDYvzQ3q6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408426; c=relaxed/simple;
	bh=5W63L7vJAPPbkNRffUZ8GPvklygiDlr1K33wJZ2BgAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8SElsMW/7fAUamEC7soYfOxZdPMrmkfa1X/8uo+cRM+/u+vacCptkE69yBQ/Waj07apNZPrF0s85WomlC05JmFc8TXq/4xnuczOUta/ur9SNRWdI3sTrv83rOKEM3poeQHlEQLil98/Z7lHWWPUbnfk6AGwczHb9ZG66t0sdaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CmONUsrk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k413qycX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CmONUsrk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k413qycX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777408424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=;
	b=CmONUsrkr2XghnHP7VDcp/KTtBBWfzXkhW3OWNWv68ttv5ZKvmeujqYQDjmxWaKZy5IBqA
	VOs+IqtRFC+Y8RZTiE5jLJBxVRdXqjEgGtBvMc8rdiKc6ERO0Z8h6jr3Lnf8vc0yIxUzLB
	DruexHjgdDBO5QmsWN5fSNoIQpAIFXk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-zm2aXmHdOSmFNytzIQWKzg-1; Tue, 28 Apr 2026 16:33:42 -0400
X-MC-Unique: zm2aXmHdOSmFNytzIQWKzg-1
X-Mimecast-MFC-AGG-ID: zm2aXmHdOSmFNytzIQWKzg_1777408422
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb007bc36so22596791cf.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777408422; x=1778013222; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=;
        b=k413qycXZ1s7AQV+o4V9BdWtSu+G7FgiNU2M9ZM9NlPyZ9jlbG/NxXJSZ8LjkVAVt2
         1yxHF2+3dMCnwVYReqzcMAg6N8OUNzo6XBBm+6PGNuyDGh7Rp1TOddqv3FTDPOuG8+m2
         Y3+1fAsW2jRmGXmL04Hz4S3cXi+nbnxIMQ/W34HQta70+Nc93ApI+pxrD3BxXiu8kdwf
         eB6lQXrg+jNtKgH6/XgPD/ALtEkZ+VBCVvOxhtsGWmeyloepWiITAKL7cuuyN1kLAJzh
         ORxUO4t1rtIkAF5HgNc1m9s3G1HJZg6uPwTK8P6XN6Y5Js4eGxfS6nSznxow5BqsjlPn
         zMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408422; x=1778013222;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHwv8IafpIjW7d96DL7qFjkHOZaLx+9q+VBMqdpAtL0=;
        b=aDIXelWwD2PTF78TAzqZwW3gLhZRq2pwgtrowxahno4uf1zEfu3iDbZNFG5sMucts3
         IxqZ2R58E1g2i4TFr/IlKBu2hj/gqCzOXJIK1m7stLjn981FBGTygyMbvtnTadhzdwac
         T+RtOntXaNhWPZv96E3J+/xkeR8bBKtIrtQ+8ApciQQ//O0CprMZTBX4lnYmL3ber5N0
         epifcCtBtRJPW7XP6KYLEoqtzEFPPq0AGGtwriEMGzxlqFyLuRrGTleXkQS9w/LChu/m
         uMpstvh07DtrVAoxPHO8HI0LxXGgkWwbTECJS7Gb4OHFSDtIe6RcffhgM/2UrkgF62SJ
         FH6w==
X-Forwarded-Encrypted: i=1; AFNElJ9Ky0F5Ke5tCl55D8VQckP6+C3gWx9oaR5xlPWBBbSRd4P+BArSWs2hskUOhF0Pr1Jc70kDPNuQ1kY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9jeU1C6VSf+GmfqDAL8aKNKCrXDX68DL06TpJL7M9P/y63fc
	H91WfRS8AfJt4lkAFexQhQX5ybXKV8WweU1e1U8F6x3A5c/jXRnsTbn3OU7RCkU+oPWkznb/6U6
	i9V1rA4itqf0P4zRgFT1yNtdqfNTZw+FpmJvaM/6qlfRoMzbJHGpPSDTngawQfQ==
X-Gm-Gg: AeBDiesDGZOWUuNLlIf4o5FgqIunDwISnwmpipIL906PRak5FEcvFc7QlNvfxiOfj9R
	olVkhnBhkbxIJUlrge+EuN9OjtkIdLLn2Eajydehz/mfQescZcuaqOLThz5HWRt0JkmsYz1FeBK
	JLuLU/QLEZ513onwsbfh9lVr+YetXrkrOTEMFhOgefDEKpap2oPBzC4wQWb43X7unIONCsi+9Gc
	gmNwONJJ5ltcXeRiODrbzd+CXcny3/nt+ePUtbeWfLu/nX/ItZRIr2hnp3b0cQZ9FV6ZRbU4d7h
	T3cBeP1WdmVHTjDfBOXDLYbNqtYMAWjiQgm8mai7ZEAC/E410fkjoEqocmNdV0plcONSpLYtsGV
	GjV09upIyZwsNiLCn/VpxfYr5LLc6fp4=
X-Received: by 2002:a05:622a:1f8f:b0:50f:be4f:4664 with SMTP id d75a77b69052e-51018a4727fmr18458281cf.32.1777408422371;
        Tue, 28 Apr 2026 13:33:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:50f:be4f:4664 with SMTP id d75a77b69052e-51018a4727fmr18457831cf.32.1777408421914;
        Tue, 28 Apr 2026 13:33:41 -0700 (PDT)
Received: from redhat.com ([2600:382:8104:bdc6:d862:7b9c:1d01:62e0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100da4d312sm25243291cf.1.2026.04.28.13.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:33:41 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:33:38 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <afEZotnIZYXEtMiC@redhat.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428201522.903875-4-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Cristian,

On Tue, Apr 28, 2026 at 09:15:10PM +0100, Cristian Marussi wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
> 
> No functional change.
> 
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> @brian: I'd modify further this clk-scmi driver, with a patch on top of
> this series, to properly use your new CLK_ROUNDING_NOOP flag once your
> series AND another (already reviewed) series on clk-scmi from Peng are in.

I don't know if Stephen is going to pick up my CLK_ROUNDING_NOOP series.
We talked about it in person at LPC in Tokyo, and he was the one that
suggested the flag rather than a new shared noop function. However he
didn't pick it up last development cycle.

I would recommend NOT basing on that series of mine to reduce
dependencies, and so that your stuff doesn't get held up by series.

Brian

