Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AC82D7DC6
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697151; cv=none; b=EFXG1jMirZx6JloC3k1+wxWi0jlHQk0yqtbl5Qdv2DNhXekZv+cTW7E0Itad/Fb3MtOR3/2TG5clMb5/ZdgDWM4Lt0c/psrDdx4UEoHIK+/kH4mGsmQWOCI+nYQTFE6PGRpv0SHLtnbCOZIGL8x4Bitv9wcmpAjQOmPzhGziSKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697151; c=relaxed/simple;
	bh=ZhioHhKCI3c9+3BTGfqNVVJyHhlhbfeWZ3cQGaxcT3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AnxvjwSmYTWqX59DY5NY7NtU13Vwn4K2uIPePQSylEgyJ1AZgBDMeBSpMg2+XgdTYamlZeka9neJqG3UdgDKq2BTBa2V4KHpugjYnfC5r/uITjERTAFbcethgMpqS87qilu+/homA3vABD4CpfgSslcZliI/tVUSkRPXljkO0hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZzK6OUPp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hIcXm1rb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZzK6OUPp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hIcXm1rb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790697149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fsdd/ZfuXmaiSsfG+5vAWetJ7u+NesgPGBI4SS5aNWI=;
	b=ZzK6OUPprazgv/duPlku/fICRK54gEj++K7t1o9vmVu71Tu1pgka9Q1Fh+6tO63BdiSb7N
	hTwkuz1aDgFZ70vrOWrk2GXqSdB3RhlqinU8rA784ICUCtAgEFAsYuEgWC+1DN/ckIXcPj
	/QyMfhprUQHp697zL5QabYqChB3noXg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-UuKRpApDNwGBspfY9rtjPQ-1; Tue, 29 Sep 2026 11:52:28 -0400
X-MC-Unique: UuKRpApDNwGBspfY9rtjPQ-1
X-Mimecast-MFC-AGG-ID: UuKRpApDNwGBspfY9rtjPQ_1790697147
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53333acddb5so80806241cf.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790697147; x=1791301947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsdd/ZfuXmaiSsfG+5vAWetJ7u+NesgPGBI4SS5aNWI=;
        b=hIcXm1rbNSUC2IVlsLaIK/UbU6LwWoxGb98VpHDN09pMj2vBNpK0lgKlTSGK/WgNTU
         YhRogaqq9WNdZzomqpV0tF69O8j1Yq+AYnxCMtpbmbFSbJkTDz4Cof5qPup6vfXfGFsW
         4r0lhz51abY/RX1/zdM5EqmpQB9NkoUkmIM7701RxmeoZ7mMdUWgzU0FWY6GPyYlBRHU
         nK8QrDlKqEhWRmbwWvbA8ges6jCNvKtFETZwAVne39+wFj2ogfwJ0QPiauurM6+yB/kW
         il5Moq+sNPZK6RFCV4gIEUXm8ToGpYWg+CVCBblo2kjJx5Ym8ME6SLM7zzhnceRprSeh
         E2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697147; x=1791301947;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsdd/ZfuXmaiSsfG+5vAWetJ7u+NesgPGBI4SS5aNWI=;
        b=M4d0v62008fCC9dhEgEjec1fE73baP2dMpOtB3vEeQxDWtpauqmgDOguEOFeccU67u
         PJGLDs+89xBS/1KaJQgJ/7mewii4fNga/kJwanALB8VciSa0iTVB2XJgQR/hswXR2fUm
         bfPq9VmZ1ohDeQEmk4pZ/kVf9EW+96jAB+JG+w9+12cB+55mJgNouNHDwut7kBq/tN0g
         w/E8d2fIsVDfPjw5Zh5w4URZtjW90B72R9GAqTRk+NNUS8Y4/uF/M/sqMFiA+mut0YvQ
         AQw1lA9QjXkAAnAIKgI9fFg47JUe6x0DPVeZ30LxFGuktNreJuI/8tiXCbd9KMTMT8yQ
         SbAA==
X-Forwarded-Encrypted: i=1; AKwUvByhBhJP5OngDLE6dMVhbGfIfj3KuCJuy9nYg2ph2L9NQfm+Wem3cENiBpozHSPQLCWm8M406HhGejg=@vger.kernel.org
X-Gm-Message-State: AFuF++nIop/jotd7SJ9x5La9GVL81DwtVjxD2itKqvoUdtD2dcSW5DBD
	u+AXqF1ZgM2Aq+h6BXeV4F/u0iPbJyasyN2+AF5H0MFYLtluDjSTT67mEi2UxGnc38vN4C7H+d8
	5CezT2oo++Ubc+OTUdbu4eXZXEPd5PJgrlUgC31zhWYv5pMspX1CJRX2k/R5YQnKfHsncvA==
X-Gm-Gg: AYBFou3L6D8/4xmPprrPh4/KGI19VqgwH7d2gbHB9B2Miumv5T5QlkTkcFCAH40H18M
	TwbZXlrTFRtaMLJbkAqXJetYSnCBjin46pSo5enkseRDsFD6lJKIem/wQRAfXVKwYG3w9NQgAJ0
	Juyqy/FICJs1izm/eduRcrNot8+7p3qxAazyhfGTKHNYH3ywYn9/7qrtmQ1O2jtVNyzr9tOtDiD
	jDA12IbxsBDENNcqvVNqKNDPG42TocJXqDK9NF+nHDC5Q+AW/6rveNCMJCN2KoPcj1oEBl4EfGL
	2KT7DcIutBjHbwCywFGsodHVlTPQR4jqwVxYCdddgrwyOgEIzY6+0lrtA8p+vAHZSR3HtfB8otI
	pyCZzH18jx+/EuKE7JZMgzBKvVTrP9UKlWX3tz7eX4VkgcZ+6JnQ=
X-Received: by 2002:a05:622a:a05:b0:533:4359:b6be with SMTP id d75a77b69052e-5334359c1b0mr126510351cf.9.1790697147320;
        Tue, 29 Sep 2026 08:52:27 -0700 (PDT)
X-Received: by 2002:a05:622a:a05:b0:533:4359:b6be with SMTP id d75a77b69052e-5334359c1b0mr126509881cf.9.1790697146764;
        Tue, 29 Sep 2026 08:52:26 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322020e91sm89606841cf.1.2026.09.29.08.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:52:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
 phucduc.bui@gmail.com
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20260724070457.24007-1-phucduc.bui@gmail.com>
References: <20260724070457.24007-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] clk: si521xx: restore cache_only on regcache_sync()
 failure in resume
Message-Id: <179069712462.199845.6340553951907887636.b4-ty@b4>
Date: Tue, 29 Sep 2026 11:52:04 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=351; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=2VVbrhExCycg0VvIpM/2JFaJtJS75797ZuxbfhvmGSM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ239veUd1xem/IRpMLZw1eZUcfb+JZpfv9xuvVvB1vG
 9YHPH6j3VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEYicyMjxq0psq+dr9oIRY
 OzML79Pw2cI9r0xNEuY2dgj+XvC7tYqRYfP6XQYlXld3d/1e/PzKZ5YTXB7LXzR5hPdGGwUuuft
 pAjMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 24 Jul 2026 14:04:57 +0700, phucduc.bui@gmail.com wrote:
> clk: si521xx: restore cache_only on regcache_sync() failure in resume

Applied, thanks!

[1/1] clk: si521xx: restore cache_only on regcache_sync() failure in resume
      commit: 906fddec02bc9381ca872544820bd4d610cfa20c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

