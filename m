Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5DB171D2
	for <linux-clk@vger.kernel.org>; Tue, 20 May 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769352; cv=none; b=SZqSjrJC1NoxphtLlIus9T8k11d7qq1TZT//hczIdJ5kmsp+XlLO2gn6RLGfU5KfSah0ygk5k2dCzGcfb2b4SV0MMxBMBb4ImDKObXw4Z6DbSqWpvDHl20MzUpAp+31XCHUbk+fmsCRglCglJfv2ReDCpcVM4gdLtOHrN008JfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769352; c=relaxed/simple;
	bh=07Yw41PCAfN/Ts4mVtzsfW85UA9i3X+tXkUv+UZqSSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=JuKktl3P6p7+fWPDYDJBdRvYRvlhWfnRHm8Jl+pLEGvOgTp5VLFLjK+BOWBhopAyHXaRqMcGU0gdsC+uke5c6ChY7jqIJ68bT8+6+0o+0UJkYevMankO8j+9ZQKLEogA0kJu5D87IHAyNHxLNZLfHYQWajfdbE+muVdVKSm+1s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b4i8xxtT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b4i8xxtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747769349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5TDjZSLgZRYFv07Fj5qQ5qr4Txm6RJW3wHZw4fBE6+A=;
	b=b4i8xxtTTXtgPsDoUNa5SDGBHBb/UTOWo20GEOvXCLXjs4HHiPjxykmn9yP7fFzYo/w4VS
	I5GZWsdIsFxDqJwulvzZge/tPZqF1LAztGEZCNLJvldIXJP+fJu2kzEi9Ls5J7gRqKgseJ
	90SG1KY00IjBhosKEP0Soq2sg6Vfzmk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-18zivCqbMn21HmcvAd9ZDQ-1; Tue, 20 May 2025 15:29:08 -0400
X-MC-Unique: 18zivCqbMn21HmcvAd9ZDQ-1
X-Mimecast-MFC-AGG-ID: 18zivCqbMn21HmcvAd9ZDQ_1747769348
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c2ad9cf2so70091696d6.3
        for <linux-clk@vger.kernel.org>; Tue, 20 May 2025 12:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769348; x=1748374148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TDjZSLgZRYFv07Fj5qQ5qr4Txm6RJW3wHZw4fBE6+A=;
        b=SvTpX0z8mv59WUcAwGj4ZBiN4/Mij5jFZ0gnuURBXlAZKcyBu/cDqqFrvnNl4TtZlF
         b2HvxcaioVhUyim6qnpxW71WRCWIpIR65GaK7/eZjaZxVRfy43tR/LiFKOcCnUpL8EQD
         Po8A/SNvnSyzuO3q+zhi1JpCfpMWg3z/IVH0SCiw4irpQMdrsh1iiTiie2M2lL1Rnoga
         kSSciIvvEg/uo6jpW4AOhCkHjE44YY1CMJU7U2JEsVtw9axEZjOQpMRaIblISJVwyM50
         xLE6khbSN51nwCnE7HAlqTJp2bFbMD3Xg36F9Jb2SLjXiAOnKJkLeCnlY1BSUwH0GSxb
         /yiw==
X-Forwarded-Encrypted: i=1; AJvYcCVEly5TiOvUmBBVceMXdX0sX5T8c4qeCxdvi6DcEoQCjkUMHMZhF6DtfhVrH3GcGpZPREo1aGqDxVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytI+3H10C3umuArO2FbBP5x5VQvFaBrWvwTuDDp0Yot9h/6A+d
	O6HrKghJsdgifd/Mvp42w1WYwLqWScuQ6VoZA70DelUQU6BFji1mxBxqizlpBYhU+HTEy1ggKU4
	Q+Nu9nutQGJ8b0yLcTPY8UMmRiKiWSZi6vpFkrvEHzGWH4yzzG0fveo2x0Zarlg==
X-Gm-Gg: ASbGncvF3nVIv76m5zKBCfGQLxKy0r8GbVO3IFZ6H2gSYOk9b/Max+adWbvPdrvbrXu
	0wqdvQOBSF3z9p08z3flC3Qvt0jOoO23Momks1i0KUuO9VbcRcDDots/qB6HfJJy4OmIPKc8IN6
	7+93hBCckbBqiEpO6C4e5+AOstjcH9lSYZIc9TFufaxxtZ82CcfU+ud6JwB7ijYO3Ugi+xA2OSk
	08AFATB2B0g8k4VA8HjK34WS5ydqib6hC06TBU2qO3g1aM7V4gVvPDaxB48SMZtPNsWY0gVW4dM
	yKqt
X-Received: by 2002:a05:6214:1d0d:b0:6ea:d69c:a22e with SMTP id 6a1803df08f44-6f8b2d856dcmr245669526d6.30.1747769347706;
        Tue, 20 May 2025 12:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuVbutCXqDSAWNIClFgBwzIL5GXhFguZ65nf6nF04DBXXzE/JIFAEgSyJSbfsU5ITXJ5w9Qg==
X-Received: by 2002:a05:6214:1d0d:b0:6ea:d69c:a22e with SMTP id 6a1803df08f44-6f8b2d856dcmr245669066d6.30.1747769347244;
        Tue, 20 May 2025 12:29:07 -0700 (PDT)
Received: from x13s.. ([2600:382:810a:a775:a7c2:b4b2:4756:68b2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ac502sm76018156d6.42.2025.05.20.12.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:29:06 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	mripard@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: preserve original rate when a sibling clk changes it's rate
Date: Tue, 20 May 2025 15:28:44 -0400
Message-ID: <20250520192846.9614-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Here's a patch that helps to preserve the original clk rate on sibling
clks when the parent has it's rate changed. More details are on the
patch.

This series needs to be applied on top of my clk kunit tests that
document some issues that need to be fixed in the clk core:
https://lore.kernel.org/lkml/20250407131258.70638-1-bmasney@redhat.com/
This series fixes an issue in the clk core so that two of my kunit
tests can be enabled.

I will be at Embedded Linux Conference / OSS Summit in Denver, CO from
June 23-25th 2025 in case anyone would like to discuss some of these
issues and changes to the clk core in person.

Brian Masney (2):
  clk: preserve original rate when a sibling clk changes it's rate
  clk: test: remove kunit_skip() for divider tests that have been fixed

 drivers/clk/clk.c      | 28 ++++++++++++++++++++++++++--
 drivers/clk/clk_test.c |  4 ----
 2 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.49.0

