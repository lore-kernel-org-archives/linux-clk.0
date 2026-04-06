Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A0B30EF9B
	for <linux-clk@vger.kernel.org>; Mon,  6 Apr 2026 16:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775492554; cv=none; b=g/aLaywFBrpzuoMWLgioDbhlPOWQnx1koxIOcgp0ZcCOol+0Gor7YYltmOSusU1/Y3BqPlcqtuCq812D4NbnBlZAt9YQWboSgt1H+u8N3Al3RVI/Vj+ygKAh2n+OyZYfCCFsXkthToiakGNoZ1UtL8dt9+KjcmpqePzNfFgdeOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775492554; c=relaxed/simple;
	bh=ijCVD0aiqNDn7jPG5o5A2gGQwTRCME0B7xk89odnK4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efqQz6qrddnPL7dz+4U7yDT3A/SY6F6wlfVFB5qlBQvjXDDzvjp3XOtdF1OKTjjF+rZfEBS1YBIHF/xnlkG7uyT7Y39xLVtbxPYuUbuKPsPDfN8ZYm6jEObz4xZRF06oP6D4vt9j8DPFVIvZZSWjHEytJ/NyHFn1HfkNVM+sla4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JaFNq6/X; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o5Zm6Ye+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JaFNq6/X";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o5Zm6Ye+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775492551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sWslBRf0qez7073VMBbYbm8uIhmaBf/eGLBWgOwRt/A=;
	b=JaFNq6/XRLcn4ySGWkjlWJetnBb2WrNyLGNVKmsiflq4nM4em2wyt6q6gJIlEk7yckDqi7
	cg37iKHr0k5NtDuHdho19k9uWTsQ9K6DXiH/05LfmU4xQ0p2ilmiN00wZEhOhBPHbA2Kua
	lFVGDIm1F7BD6SnH4A+23HutpR07lrI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-yli8DTO6N-OBNz4ero7nBg-1; Mon, 06 Apr 2026 12:22:30 -0400
X-MC-Unique: yli8DTO6N-OBNz4ero7nBg-1
X-Mimecast-MFC-AGG-ID: yli8DTO6N-OBNz4ero7nBg_1775492549
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d60fca52b9so355842785a.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Apr 2026 09:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775492549; x=1776097349; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWslBRf0qez7073VMBbYbm8uIhmaBf/eGLBWgOwRt/A=;
        b=o5Zm6Ye+pwWDBcNdnUDV5OMnMSLv954ib42gyHDxPw2w1r2pprY7/uG8NvZkK29OoV
         R/wLrAZlRfEsiGLu5AdUQxlir3CTN01E+wh32MbzFxut+xOO6syS37gwjffweHBaaeSG
         D346Kzys7sV3PAxlVFTWH2T8LS3d+hkyj983c1H6O/DDRfRITPvB/QMdrbQSr+zXF78m
         rYpJo5JjLWFPPHV4VykOtnmATsfVnyCgnnZoCCQC7+XlQgbs/4lbIZ6KqfaTdwIC4h24
         RFpLo0tmXXec7ZRZsCWJyWnLRoPOzLylvxlF4CiUJ8MY2v68jnCdjlvdsKKs2DpnDxZH
         Kyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775492549; x=1776097349;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sWslBRf0qez7073VMBbYbm8uIhmaBf/eGLBWgOwRt/A=;
        b=iUynefbniXpusV2V5I7kuO3hXtdjIfV6weV4Jm/0fv7SNhvzuNBGdMRvcW5W9v/+cz
         j3WVud6kOPt7Neq6h7KocapTEWq7WcQcbG1lOHgJ8Lllko8AkktffJEmhOTuPCf6LXlN
         sq5lFPsY/zI92jY8wxxGZNWO4vRSlWKfsSDPAIFyhg8O9e/o1ZqvH41PCMKXXFtFuY7I
         xyUjRP6eoPPbfaAbWhfQUXaGUthteQceYSStxIuIRqBjZXRTgC5r3UbR7B0nLYpYAUvf
         LWtvgn9n3scalhPr6j4JQXwOO6ScB1Ydj7eb8LB1Wk3bdzrdn/nB1PVdP5RZHEaaKO6k
         os2w==
X-Gm-Message-State: AOJu0Yy8qTOBpt+u8NWnTxyEvgnfA8BGJwTsdsaa0KVm2NKUoCYbm5J1
	4CflDqS9mE2marnzGc/5s4B+ym3OrGXWqVBEZWqVtzNVweWuy9S5lBSya3chnIlLCioz5rX63L8
	8ChgoFMHcT+tWfJK6XHg+/Oe0gnv0VcjQNoEbBgd1PPcOYQPEBJ7Ohxdqyyd6dg==
X-Gm-Gg: AeBDievdZd4gz055wRlBdygHi288bBMAAyplvKUXqCR+ABgcJnXT8075CEvnlGBGLf4
	Cnca4HclrMCygj55gtu14fQ+zwkLHPDfQIx4mNppnQ7qxwgUwH/VwvFGzmnrNYr7lZ/exTztEG0
	xlIY9tSBzSR+9GmiXDcXlR5i+2LKod19HLPC6uRamAQGRs28tyS9XwMgLBQP5c2eFIqqtzom9gz
	v4uHwCdyI3x43zzZEPznLznuatqT5rbOchq4+SnGUeACKJyQCykxEBE1HDkMd8VxU+Xowu7BZDv
	yCPFOGkfNZf4Fqhol4w/jRbGCqqCl6p3s2aXN3HZFyC6kGK4S7NiXZmJA7sBsqzj0I3E6bNz2Xv
	3x3DFhLXaj9iZfS7IzN169jW1xRyS6Uc+9cOTRwrQf7idYGd182pD8Rxz
X-Received: by 2002:a05:620a:1983:b0:8cf:d717:c22e with SMTP id af79cd13be357-8d41c3b4bbfmr1914123885a.28.1775492549549;
        Mon, 06 Apr 2026 09:22:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:8cf:d717:c22e with SMTP id af79cd13be357-8d41c3b4bbfmr1914116585a.28.1775492548827;
        Mon, 06 Apr 2026 09:22:28 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a5c5cb5csm1099220585a.15.2026.04.06.09.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:22:27 -0700 (PDT)
Date: Mon, 6 Apr 2026 12:22:25 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] clk: mvebu: use kzalloc_flex
Message-ID: <adPdwTGDdt5MkDp6@redhat.com>
References: <20260403194701.11902-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403194701.11902-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Rosen,

On Fri, Apr 03, 2026 at 12:47:01PM -0700, Rosen Penev wrote:
> Use a flexible array member to combine kzalloc and kcalloc in one
> allocation so they can be freed together.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment right after allocation as done by kzalloc_flex with GCC >=
> 15.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: remove now unused goto label.

Reviewed-by: Brian Masney <bmasney@redhat.com>

This is the third time that I've asked you this [1]: For the future, if
someone asks for changes in a previous version, then be sure to CC them
on the next revision. I was the one that found the unused goto in v1.

[1] https://lore.kernel.org/linux-clk/acvUoSOOF_9UQC75@redhat.com/
    https://lore.kernel.org/linux-clk/ac0o7XbBm8aBOa7a@redhat.com/

