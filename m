Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1183435F178
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775592129; cv=none; b=SmUX4ZteSxLl7PnWFESvQWm9+J5lMH+kX/EI/wky7J6mqDgzjEkYu0beommYiA0+KyJ3N6kyMrAOBLlrCQR7MKMlwdu/PC1Jw/FDycytTov0TaUVHjJRGubB+Hqk3YCuzZvbdv9Cz8SwBjdfOu48L0OuuOWBi7h4pfmpmiJtyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775592129; c=relaxed/simple;
	bh=hJtN8K1NO+1GlGmjmYQ1CDezEvY+K0yC5MUDZO/1Nm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pR8kn/FNIWotgWdY7JnXJF5YBpbvQoFM5/N09ATYovRVN72yoDas+OLmUKIafy+RMi0bI5KbcQ0ewsuHnSw+Q2Wv9ATcNRp3eXNtIv+r+0JWhBTEgfcr9YHeCobdW9HUp/SOvEgA0i0DDEau6/IWK9aHUPlaO360ATsd724qZVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YMvcfAxk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FqWx5VeI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YMvcfAxk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FqWx5VeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775592126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nwpk7x3/OYthLLbkTiH6r3E3G4VZBvtoK/r2DsOIAbs=;
	b=YMvcfAxk77m/CeyFAaAbZnOr/1SZZcbOWn+R+VmUpZ5+614dH9Nm338uzfPQE1MiNt94fy
	j0V7gvKV3yVB0BNskjP7DAnHp89CEEYrdXHU2RYuzj4A7nlZxEGYGRRlnVgRLfIywl2JpI
	ZAoBFe55moFmNxhjWhvzUV1rKL0ZNX8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-O6hlXYbRNtWx5V-ueqxdSA-1; Tue, 07 Apr 2026 16:02:05 -0400
X-MC-Unique: O6hlXYbRNtWx5V-ueqxdSA-1
X-Mimecast-MFC-AGG-ID: O6hlXYbRNtWx5V-ueqxdSA_1775592125
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so244395291cf.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 13:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775592125; x=1776196925; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nwpk7x3/OYthLLbkTiH6r3E3G4VZBvtoK/r2DsOIAbs=;
        b=FqWx5VeIOfWSE4/QZPtqixPyXmZl9IrlsvnRZ//NWBlMIXudBruVWDjKNnhSokOEdK
         +EdW+rCv2s5wFVVgeWnp169ci6NoZTPnwRptjRR3yrLm6v88iPCZk8ofdlfPJFdTU07F
         6CD95+uOmTziiZsm57uj0+JdcD/VgTI1JYA7EOv5DWe/Wsb5QTdOfl7DmQe0nkTHT+nA
         ibDLeu6uriUa3ANx+VrRuB5ET91gwoPj+u/wKqjPwMQmYz/ilCxG33eAuARwQshXzhez
         oYaarivonjgfYRVuk+0uXvpK6NNeIGN0ptwnFDbZMaSMex2Uq+hvsVIjCS1lmbTfYP0x
         LKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775592125; x=1776196925;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nwpk7x3/OYthLLbkTiH6r3E3G4VZBvtoK/r2DsOIAbs=;
        b=K6dYsBzHW06CP/CPtZ/6sckh5iE3QE3Xw/Ehxx06Y5b0CMnO/q8XZMSKLn/xpet4oN
         MC00S6xrREgWEBgjAm7ubeixtKkeaIeryiAdp3pZiSedyThMBrsgyjU4e2NayE2BCe+z
         DyQyP6jJvdvpSXT04WCwTWdQGCeYxkFIzsvVHMbXSTOz9p/y+kwf8nxcuOIids3PwjjP
         z+Etv9SdrjWmhFPKKGQEyumg74IwUIQlUJ9ZV7k7dnCpKyM+/zc2IzqUDtetEkiQzThX
         aB1jAgTgPEP5f8i+7owavPErme2YgJOVYMbgS6zCgq08JLmhyBEkA5TRUijds/NuKdVf
         0jig==
X-Forwarded-Encrypted: i=1; AJvYcCXpG3Er8rb+JsdhjBudcN/p/nLtfunDzYmkwfiRRzGvBUE1dqV3CzsgbSZDoTa4UwQCu9+m+oCua5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw22cVX9iSRLBOolOt3TplsSN1/sTuX/Gd+EovIkXgZL5eo0vyT
	g1zj9vx1uoi724jkhQpV0sto4jqTFQSdzoIngH98aabsEpTqwGPfzHdeYv47V/XsP5e4xZ9RI2U
	1d1Xx2N/gFyjb/dilOfkbtQpzdcUdAI54cy9Nydtjjuzk448ULt5WpMUmoQUl5w==
X-Gm-Gg: AeBDieu+r5Z+IPJ7OL9Bl2EeMs3r94FSZD+KMxN3s57bGLLfLuz9HytV6PoASR6W5XL
	XQEUwCVpck7Fz7w1ZamrblkAfvnj5pT805hgD735YTMxrDgRxgKFt1mWry6ekHpdi5zeMKabEb+
	MwoU30Sfre6xA2bRFOLDccJU9Hz/ctIyjqZL71FY+ixE9+3HhrnNCjdItQDz8+IGRs7wptaRSje
	Jh+WmRwGohhhPrL4GXT7yMiOVVls/jy2V8eSH5ib5Fx3njfSA9xjXtR49vOXFdHT8lh6NM4WMRd
	iNRzusVZw0f8M9Am+/75rythljK8xuTVb7tOA+FQX2BVzl3tkYUoRHTT+VpITvTjH0enwSzrKgT
	yA9Ps35gdd6GCjHhoAL8=
X-Received: by 2002:ac8:7d16:0:b0:50d:66b6:1564 with SMTP id d75a77b69052e-50d66b61c27mr270620051cf.14.1775592125157;
        Tue, 07 Apr 2026 13:02:05 -0700 (PDT)
X-Received: by 2002:ac8:7d16:0:b0:50d:66b6:1564 with SMTP id d75a77b69052e-50d66b61c27mr270619401cf.14.1775592124495;
        Tue, 07 Apr 2026 13:02:04 -0700 (PDT)
Received: from redhat.com ([2600:382:772d:3619:ed0:4a9c:acd6:3fc9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b32b59csm177586281cf.13.2026.04.07.13.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 13:02:03 -0700 (PDT)
Date: Tue, 7 Apr 2026 16:02:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Johan Hovold <johan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] clk: rk808: fix OF node reference imbalance
Message-ID: <adViubS3B7BfRlWB@redhat.com>
References: <20260407095027.2625516-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407095027.2625516-1-johan@kernel.org>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Tue, Apr 07, 2026 at 11:50:27AM +0200, Johan Hovold wrote:
> The driver reuses the OF node of the parent multi-function device but
> fails to take another reference to balance the one dropped by the
> platform bus code when unbinding the MFD and deregistering the child
> devices.
> 
> Fix this by using the intended helper for reusing OF nodes.
> 
> Fixes: 2dc51ca822e4 ("clk: RK808: Reduce 'struct rk808' usage")
> Cc: stable@vger.kernel.org	# 6.5
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

