Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D43FFD
	for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 23:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771801322; cv=none; b=dFcUjf4Q+vH6BPf8vIKXLtuXlMj5/HeMkWalXz9eB45Lu2N4YjKso73pLCayA0ON5UcL14ug0e7toyO3EveJGj4LGmHpTazN5/IBYQ5yUGPVA+0p8qHNr+uCXy/eHZHYAEF5AesdPQl0QRdPSY+6TrVrife8HDahknKfi7eSED0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771801322; c=relaxed/simple;
	bh=V6KpGL69TczRZCEMSgZc9IktS4ArY13IpJofeDtRH20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPpEKLLlIZEQNpFS3zMsCjJPCSzATI+KA2dg5PCAAD001XLFLg/A9JdEUby7RLjgf9owjMlC+u16grolEi/WwNy6h+rWE+1LPhelRJhAlJqxJVhioKwinklNBfhiT15cY2P5u5dQ+n88HL0TUFJupPspeBC3W69G6S2eGYMFvX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TRPASbpz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q+RCctyJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TRPASbpz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q+RCctyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771801320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=CRbAOsvSkvcigTRxBIAD2yXagg/nhTzutguk9VZdENc=;
	b=TRPASbpzt5fu2W2zNgyFq6AX2JhJvafxwxWGNsdcu7MZ7ysLVKtoNDxbIEDsHlFq86AaVw
	O1lskGYetwkX0cFt2mIfpmFdnGJx43VFLC/rtliBmpa4bWMnLt9qhKI9UrNxXnnLwFVOjN
	oLRgbkp3d3YDx2Vmar/Z1yY9vmHX7wQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-9cWAHfbIMQCDBIkcAbw1pQ-1; Sun, 22 Feb 2026 18:01:58 -0500
X-MC-Unique: 9cWAHfbIMQCDBIkcAbw1pQ-1
X-Mimecast-MFC-AGG-ID: 9cWAHfbIMQCDBIkcAbw1pQ_1771801318
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70e610242so3781731885a.2
        for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771801318; x=1772406118; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CRbAOsvSkvcigTRxBIAD2yXagg/nhTzutguk9VZdENc=;
        b=q+RCctyJcnneZE1mUAEiAYtcSl/ZakRFy2319PD0sgy9yqqxerFeqwSAam95zbJ64v
         g9KQU3d543/KxNaXvxdbbae6N/lDJ22I0ADxu5YZ8TkRsAZzr5fr8yGwcOILWE/iVMtC
         r4LnwNTOulhRWnmqYyAH7j62NTrcaJRTivuch33ZvTetYRj6wbXUs0Wk5oB4uD0NCaMy
         6U0KlFTGtFtMKyqHtOkS9e2GPSfNzrM4K+AHXWHJWy7B6FLK3iAHKAgNK63X13+8/+cG
         X1deD+COzQBZ0Kw2ETeoYn4U1Hq7wpTPFntVly2BXTHx8IIs8RrpKnQOyO/HpHhnw4Qm
         GK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771801318; x=1772406118;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRbAOsvSkvcigTRxBIAD2yXagg/nhTzutguk9VZdENc=;
        b=Mr3R73ILCViDhaA7esDGxoecRZ+wSnl8zUrPDQNaEiaiU0McXTJqFJYRCMiL8JTbZC
         g49HXm9x34+ZwfLMpxBi/Ow94SmsB/rb2BuIsZ9IjebXRb+p2IC+2GevrwR8FeKrDDcs
         kpr7y9vJVAXGhglc9OYl2316otx9F/IpHp4eTbX5Y+5bINSotP00Ly0WXy7verEcVo+T
         Cdfn2Nh9PuQTGYzOvBpmmj8eBpgHzm1hIJPPK20NEMZ57Axd6lxJ4vKRDyCWePP5eAJV
         wvhNeXAJeVjacyV9W1gfm5KM0DdE5iFRjxbm2YNzE/dAVY/YPAtnMreWPY3IBgN9HTMc
         CTLg==
X-Gm-Message-State: AOJu0Yw1b2EDUNGSf1IiqV+geh6NBrYeq4MgKOZRBtUv9LswJQV1SdDx
	rDlNHLD9BD/SUOP2hU8ejNitgjjqfzs8fDNbhObt5zf9wZ6xkRVnIUeFDvjq1OX0459QOl/85fk
	I5XArLPINlaaF/JDhfKwFn8QUkAz3zlBukhiUX2HPoPv2kixjAf3bplwQZmTBMA==
X-Gm-Gg: AZuq6aLokaCn9nj/WAlshJEG3m6TihKhivR1SiSyysKcXXxe+qS/0/pvI+N6y4Lt9Ke
	1FjXssbGLja+0M+CQMKDFIBapDc5KYfUkGQ6oRo8qsTm3BfB2Z/5G4ZdnkX0jRVU5pb30snwHJc
	kbz9tCgpcZpf/e/j0QYo+yBv2QpxFevF44Tbl7qXkH+EfRX5mOpGcP+Yt63gLoBqakZeeSACm2i
	nN/mYJOtxq5MfxxlybU+5RZrtdD8McryLZzkR/mH0gHoUfhROLaw/kdmFEZUQZJS1BqYGzctxUL
	tTThAWHlf39jksK0IPsKOudiuUnRkzcnBImjDERTYRRBC1QAXZMNvWlecpYow7rNP/zH2MuaOHo
	j8euse9uhrgCYubsFYIljNtEw5GDvWHvTu0MKDfr8TIIGGDVw3kprE+qM
X-Received: by 2002:a05:620a:28c3:b0:8b2:f2c5:e7f6 with SMTP id af79cd13be357-8cb8ca65f56mr813313285a.37.1771801318035;
        Sun, 22 Feb 2026 15:01:58 -0800 (PST)
X-Received: by 2002:a05:620a:28c3:b0:8b2:f2c5:e7f6 with SMTP id af79cd13be357-8cb8ca65f56mr813310685a.37.1771801317557;
        Sun, 22 Feb 2026 15:01:57 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d120080sm558377985a.47.2026.02.22.15.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:01:56 -0800 (PST)
Date: Sun, 22 Feb 2026 18:01:55 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: remove deprecated round_rate functions from the clk
 core for v7.1
Message-ID: <aZuK4-QJCXUeSxtL@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Stephen,

Here's a small pull for patches that I previously posted that removes
several deprecated APIs from the clk core. Details are in the signed
tag. I assembled this pull with the following b4 commands:

    b4 am 20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com
    b4 am --cherry-pick 26-27 20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://github.com/masneyb/linux tags/clk-remove-deprecated-apis-v7.1

for you to fetch changes up to d4851759742c1322f498021dab882d322fc34a1d:

  clk: divider: remove divider_round_rate() and divider_round_rate_parent() (2026-02-22 17:38:37 -0500)

----------------------------------------------------------------
clk: remove deprecated round_rate functions from the clk core

Now that all of the dependencies across the tree have been merged into
Linus's tree, here's a small series with the following changes:

- Converts clk-composite from round_rate() to determine_rate().
- Removes the round_rate() clk op.
- Removes the deprecated functions divider_round_rate(),
  divider_round_rate_parent(), and divider_ro_round_rate_parent() since
  these are just wrappers for the corresponding determine_rate variant.

Signed-off-by: Brian Masney <bmasney@redhat.com>

----------------------------------------------------------------
Brian Masney (5):
      clk: test: remove references to clk_ops.round_rate
      clk: composite: convert from round_rate() to determine_rate()
      clk: remove round_rate() clk ops
      clk: divider: remove divider_ro_round_rate_parent()
      clk: divider: remove divider_round_rate() and divider_round_rate_parent()

 Documentation/driver-api/clk.rst |  9 +-------
 drivers/clk/clk-composite.c      | 38 +++++----------------------------
 drivers/clk/clk-divider.c        | 44 --------------------------------------
 drivers/clk/clk.c                | 39 ++++++++++++----------------------
 drivers/clk/clk_test.c           | 16 +++++++-------
 include/linux/clk-provider.h     | 46 ++++++----------------------------------
 6 files changed, 34 insertions(+), 158 deletions(-)

