Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E6B3D3D08
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769123415; cv=none; b=JhaaAdwgLS51He4cJj7o73wLHtHJKHy5y9AVMd80FIbhZEhhWIXXljncHxoMnvN2eZmSQ+2Mtst9UV9AfFKdbisqs1O4bcmW7i1i+oQ5K7j8Wrr7+6R2HyupOt0xLUJaCjkcGUR45GmAp47tW4NR7nPWGoPj5HG1/0m+j0oSRl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769123415; c=relaxed/simple;
	bh=fxohier5lUCoNZjoQbvnb3NzZlRru4fGqVGzs90dAQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfvavZQrX2KpaJwVGls2Ic0tWZkVmWBXSZUS8zIJUeEx4zc60Ax7jnYY4yyrkbhK5Eds5mpv04NYjFoi5vsgJWjRIKv8vqtdMXtJUuJl7RoPy+qd2d/L7E4NuqDSfNUX4vwWqVCnilDlsGFpfKnzf0ioHudQjVFPzx1yyzKePrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WwGxzakt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NvGOr2E2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WwGxzakt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NvGOr2E2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769123401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BavDbeHbJ9VOae385eqgl0K+amHNnSgI2QP9OyRUoZY=;
	b=WwGxzaktIcNDodg6o9MfqZ78GAUQCpytRMAYo6PPOPQWqLSERVu8IYXvPunFC4RxXVqUT2
	Kp5yP/GjCI6HhQWSRk283h3hEAErsMk694hNnOg00LVrl40NyBBknndTF7oEiP52L4egut
	h16jfjj4erm9GpYmjo9UyYMR/WEkzEM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-Pzx3yZx8P7exA5cEc_ROpQ-1; Thu, 22 Jan 2026 18:09:59 -0500
X-MC-Unique: Pzx3yZx8P7exA5cEc_ROpQ-1
X-Mimecast-MFC-AGG-ID: Pzx3yZx8P7exA5cEc_ROpQ_1769123399
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89493622b50so607906d6.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 15:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769123399; x=1769728199; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BavDbeHbJ9VOae385eqgl0K+amHNnSgI2QP9OyRUoZY=;
        b=NvGOr2E2SIFu3LxPDn97KwHtB94phBd+LJXGE+TqJJqp6vAwknrZVmHpr02x10PyUB
         aAqlw9Q/PkLYX54TJExaDAWZB0GhiqnQcMKaJS9EaYtz5JRmmSgKZCK2DYb6mPQ7dLbF
         KSdNhgFJxvuK475fGeN5+WdNVX8/ltqoX9W4DYwI/BG8fj0CrVqGvmS6KIE38u0WO+9q
         dYygYQEKwiIJzdS4l/0+jlQ9fpKBZk5OnfKhCG9VUmg5v54MvLH3OKIUdiXCHwLcK+nt
         lAL4KQfpKiTyevqdonYukgEJUTHpqiGUMLsAmRzSXMhu1LCngW3k7wRa1VlI4wCU3uc7
         3Gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769123399; x=1769728199;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BavDbeHbJ9VOae385eqgl0K+amHNnSgI2QP9OyRUoZY=;
        b=nl/0CQLRn9W46cl74Sbn1reULNfDFRfpIaoqnfBfUVBb8xCR3pSJL7l+kTY2+QKiQx
         xpU3BOaqmTMGl6rRHMsEgNJDsW9Xuttqt8aX36q5NgjzO/N39ze05sjCrnAyCTPLZTeH
         rFBAkhXENZ+iT/2tMUrBX0c8CGpJTPymd1rtnDAqwPCSGElpYxNfn+H1k5XCa/AZ4v5W
         9drts+dZZR8IwxJqXIUGnbaAGnQpwCCh++MxzleK9bFB7tpqSHOT2f0OPjCd4jyCHeqO
         LdaAedVO+s7hwwXqNONI9dsX3XdV/SsmOToRpZri4y1P8d8PczvA3Mm+10WONYdl1BkW
         mwwA==
X-Forwarded-Encrypted: i=1; AJvYcCWSAhDWoEmSRyIT3Fo/sigRH7oEcls8+quvGbwWzBfpagYQhI9Zk5+W7e4QaWyvnt8Pbp+KVUDNazQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP9sum/rKP8KjiIbZ+doV+xjvLI7YGrTlMmoWvyKqsUanY/Srw
	uu3vBuFggoaTtENjHLH52W/MSpoqjRkp3+8qgi7+bVkMxdGoU3p+FSx6zO6dYHkWkCoEPPIZJR9
	1r9B1IeW+DySHXjMUSsND80vGYgFZOkYsklGy7U4VPMRejHDVQp/xqpdowHQClg==
X-Gm-Gg: AZuq6aKvOKm9fs1SGH2fNfxYO6AEutECH/9M+PETzyoLgB4pRiqVLX8sPkWppDTe2it
	0IQzbnfN6VoYLFXBRfHbl8zJDoV0F13OH1jO8UxEesuTZyt/sMmRm/MBo4lE3HL/4QrNuiwuj9w
	+k76m6MTqO0/t4IpWmBGUVwX/h6cNQpjAkKuX6Zi8oguydrqdVb0U8sS9A9TNGUo+m/WkR3M+2L
	SlOhZkNNsQo6zaeCyYO3CD/r39n9i0BqcpHK72kDsVJ4dZ0He4974BWjZbzAMI9xRzKKhIV8d5o
	OPgClNUHY9x3sUyRt+iv9C7IVtVeFQGap0JfJHaPKpSA82cUMeoQ34G5xiGS2R9hLNmd
X-Received: by 2002:a05:6214:c4b:b0:888:fc37:f9b7 with SMTP id 6a1803df08f44-894901b1480mr18488566d6.25.1769123399075;
        Thu, 22 Jan 2026 15:09:59 -0800 (PST)
X-Received: by 2002:a05:6214:c4b:b0:888:fc37:f9b7 with SMTP id 6a1803df08f44-894901b1480mr18488336d6.25.1769123398739;
        Thu, 22 Jan 2026 15:09:58 -0800 (PST)
Received: from redhat.com ([2603:301f:1601:7a00::a701])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3855617sm39224985a.43.2026.01.22.15.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 15:09:56 -0800 (PST)
Date: Thu, 22 Jan 2026 18:09:54 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] clk: rs9: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <aXKuQtWS3RPF_LG7@redhat.com>
References: <15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Jan 21, 2026 at 12:03:11PM +0100, Geert Uytterhoeven wrote:
> Convert the Renesas 9-series PCIe clock generator driver from
> SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

