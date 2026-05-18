Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE60F2BE65F
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119458; cv=none; b=mRUylm5yZw1ugyk2DkozYgu+DCE3fev1NMYm9C+L96V0vXR17yuaZmCd0CiciPPs3Ycg9Fz53OanzxOP/GnlQz0Q0fgXuke49MdMHbroCmFJvRrpLESxaD4zATMGrzWbSnovhp+QX1pLvrY+14i1c0RuPlHc8IraxUaIu9VVvrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119458; c=relaxed/simple;
	bh=vXjR2eqZ88JL79h/VMFqNWn0xrixlAzkrvhTZ1TF6FM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xv25HpNhmKQ6rIf3gc/sRgz0ktIAIMhgr8OAqkbK/R4zaMp8UBaPKq1+Pf8Wsu5emgPWXzQm7pXR1EQFROCaFYgBHp+EN9y7xawc5qGhltdcP6MQKqKMR7P+aQB3+9nxaOkAPpuQ9rQZAsk7n2MwRb4PcT7QhVcsPPDhnoo2h7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iSl5VFIq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QhlfmwMl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iSl5VFIq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QhlfmwMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779119452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jZFBPKlP9AsfPNcMsg7N23i/2w973Sbotda//vubk4=;
	b=iSl5VFIqcv4DBeV7rRhmNVWiz4uUzFfxGzRiFBE2xdzox6WB0Dl7gGQ8VsHJPaLSoQI9Uz
	zj1YNwhoo0w2WimZra6Ox0ynE5A6d0aaCkUhhXlI75ImhrFaKki+ymf1i84kBftukkRbr6
	BcfiFKiMSIf9dx5NB+TC2Cga0MVZzpc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-MUJN64xpMrCttahb6z1DpA-1; Mon, 18 May 2026 11:50:50 -0400
X-MC-Unique: MUJN64xpMrCttahb6z1DpA-1
X-Mimecast-MFC-AGG-ID: MUJN64xpMrCttahb6z1DpA_1779119450
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b1f4478ca7so87244356d6.3
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 08:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779119450; x=1779724250; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1jZFBPKlP9AsfPNcMsg7N23i/2w973Sbotda//vubk4=;
        b=QhlfmwMl004iqy1AQyGhqkqUChbxtl49NjuS11xiiMqb71t4g46CoeMNyD0FNB8yWg
         lS7d1m/8bOCMIkSst+YlOEAKWtvcQINCcIWG9BWyzZu/B+Nh6v3WdP6nKlFfZ+px2C7c
         DNF/0MupaWjjxjD7BT87K7EtuSNj14gdZfwqLWkJ+5iix7hq1ia2hMbN/LijVVCea30/
         lccnnUHp56gNtF/43/kgGVnds4tz1mGC4/S2a189xwrE4RIycdjqGozVTJghkOuy5srf
         eO9Wde2GQMmR2HRTqDjkdiRbJ0jSODmZBC0lkKZ8Sy8TSETp/gBTE6MOUO6Tg3dIRh3U
         HCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119450; x=1779724250;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jZFBPKlP9AsfPNcMsg7N23i/2w973Sbotda//vubk4=;
        b=nXjMugFuIW0b8RGbYiF8Xb1xwwSKMe4EOBxhDxVbK7CBkRqx/tQGzhkRRMYw3vqb4t
         4//NgCTvPHEJra+lp3Q74uRl6FmFYL5Cbr7+rRHYnIg1rCFjYufnpHqkIYS+D7TPSZKM
         j0t+Fs20nmdcEpmLG+vmHfbepeMEo/+6x5APTg7E4dsynF0obQJerKHZdG7sJureKH+9
         43xpVy4VDn7HRUlT/KcfRcIZdAROHrvrAPr1jfQlEAUQiDFgCWCBa0WhumzmGDE/5m7Z
         a9NZtr7DMLQbdJu3mcNFcqcOR6IWqO+R6Bjih7y/ZEaLDLBad5AnHQaFC7LPxs/Uze29
         PTxg==
X-Forwarded-Encrypted: i=1; AFNElJ9HaCcHdYUcUn5r39s4fd3GK4luW7IbMtwDKyzs35vF/IG2rmwmOsLOKi9k8NOV01uF6hL7qxxp00I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPzTX4iCDrneR/9WCbGRxvufIPNSDHxVBB7h693WxbTm2fOtVO
	b479WjVB1NiQgF0R6NElaAXDmyR53zEJzyjgv6FdFvu7EtQ7yX2fnvQwSQ1EyH7pEytEu7zAJxf
	YR1RBcpv5y+KoyRwRIXa4fe/5julVcEYRKvBSYpI+qXtUsecCWrpYGnx4Rq30vw==
X-Gm-Gg: Acq92OGVXzLGVDke1vH7RK7Ar/b0UjJJ1rm8cnc7AeaIJf5z6ehmgODFwxj5ZLjEzRO
	kiq4L/baStRrGokYwjAMEZiX8xgWZHKGi9Qo63Ke9HbXEzZQ9UPOKf4Qat9eM/gcF5ZUXDwLPiN
	CfOrb3osMSmye8RsdlKkaWq2hVz7s5Jhzh8Pl4mcNCE9YxjQ5syniVmRRPSN8q147Wrjtjl8/9P
	wfdsm80cXjUHESpyjCa1rxLo2w3kUyMqtF8rkxLpdQcG8X9EAmhxxCgDEs7jo4/X/ypxoHGzWg8
	IOUrE4oPOV9rM0XA8MwBVuCfsFpoa0F5LkW6kskg5aOrQAF5dg5E0HN/lfwb0vQ7zqDhckgPwe2
	u68fqjnhzYfP++gdkH/wENFmvATFUm/LwR0DF70ecJ+WO8OJIW8gS5cDt
X-Received: by 2002:a0c:f08f:0:b0:8ac:a5bc:a6b4 with SMTP id 6a1803df08f44-8ca0f6f9a59mr202573956d6.36.1779119450369;
        Mon, 18 May 2026 08:50:50 -0700 (PDT)
X-Received: by 2002:a0c:f08f:0:b0:8ac:a5bc:a6b4 with SMTP id 6a1803df08f44-8ca0f6f9a59mr202573396d6.36.1779119449764;
        Mon, 18 May 2026 08:50:49 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca361bcb20sm59770366d6.49.2026.05.18.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:50:48 -0700 (PDT)
Date: Mon, 18 May 2026 11:50:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] clk: si5341: Drop unused i2c driver_data
Message-ID: <ags1Vyo-B9KVt_mP@redhat.com>
References: <cover.1778857289.git.u.kleine-koenig@baylibre.com>
 <0c5084534ad51a99447d9f4b7bb3a68185f4ba5d.1778857289.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c5084534ad51a99447d9f4b7bb3a68185f4ba5d.1778857289.git.u.kleine-koenig@baylibre.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 15, 2026 at 05:10:39PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver doesn't make use of the value that was explicitly assigned to
> the .driver_data member. Drop the assignment.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

