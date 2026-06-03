Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6832D3A7D63
	for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2026 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496544; cv=none; b=V15YAdCfE/ieWmcQGi3HKi1u0tPPPmBVW8PuhvJW8HkeE/9CL+pQqIDifSWrdh3E23zVg77QJE3z0GxOmrIfSOVzaNuaolPLL7B0NRNOPJDVPdsO+pWQ/0idwE/c4f22gy20ehZC7TW0Hu5hd6E0NJnnWqjzfbgCVEipa2QWv0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496544; c=relaxed/simple;
	bh=l+2P1dBX81vgw2nho/fHdP1mCD8SVFm15hd0JusVrc0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N6E98v8Bg7LUehx0yBkHg4XyZ+XDXJ3JrMs+QnEId1L94SSuj7CFxoSoRu3QnyAkzuWX32Z0DvQdYPQaqQKFZxnKNwPV/BPu4gJsT0EalC0j5IKgARsX0snQoHmeLT9021YzC7txmsyk3eTX7Q0itCCmh9gCDyPlXyv6dNbFhD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FF9ZsxUV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dS2liPck; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FF9ZsxUV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dS2liPck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780496541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sFo0mY51Ge3AQT1ROXDKNVoMAp8XWclqz2ImP5QKGYM=;
	b=FF9ZsxUV3X5TpHuhmnCnd54hMQptldLiU4USCW3B0Hilc/vqSQqAxzDmYO8b2raVnl3m/S
	E3Xa4TimxV+TMdqtCmUXu+5U34Mx+wBp2+ys8bZvhyWeJg4LirSg2RUsZ5xD1WNnPX67u9
	hO4OEccBNCcdhjydlvZ/uKkBOz09YKs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-cvWXE5HMPjuymiPA99wlNw-1; Wed, 03 Jun 2026 10:22:20 -0400
X-MC-Unique: cvWXE5HMPjuymiPA99wlNw-1
X-Mimecast-MFC-AGG-ID: cvWXE5HMPjuymiPA99wlNw_1780496539
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91586cdd642so262265185a.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2026 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780496539; x=1781101339; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFo0mY51Ge3AQT1ROXDKNVoMAp8XWclqz2ImP5QKGYM=;
        b=dS2liPckVBu7OtpoibCSkzARmQcoOUQsjX0MUCcKeiiyu8TecvycqGjKPLCuCIs58a
         qM1szkY2/WMzT9xO8+LjOVATUWj01/WXZmZO0HeIdTQiQgGyayVz2BoMeVA9kFoWxSKz
         8TuEFLtpcjtPSHeJQa8JwF+L5JZwmcgf0urJZ2t16bphVw2EX72rIFgUe3ZjA2XxgBHD
         EVocNppIku8LGT2ySsnsYwRjecvDHVbE9qC6Z0RvAIdCP8WQOH2YBkMRwrJUkfbwRbgN
         1GEkCUi4wjYtHg6qCPvgqJJg/mNU2HKoLDvOC7ykghG7A+ejinB6OgbRPBB1qow4rYDl
         PmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496539; x=1781101339;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFo0mY51Ge3AQT1ROXDKNVoMAp8XWclqz2ImP5QKGYM=;
        b=meUeCm2tT9kNTyn4yH5JPhPviEkQuvLDuGZ+3UDdeen8N4vhUQEmO5NSHlXZNFWO9C
         UrQP1AycAHcSLJ068/XJGfoU2qPDF7LiaPC0EpcdDZjKyt0J2Ko2TdIbaWKUxTwE/f9L
         EURX+TK7mBRi5n4Pt//3nsbGHK0eh0AOFjw1n30P/vZqI92Yewf9q5V2bkHQGy6N7vwj
         b284M+QntJDO17l7viLcH0L1rEUhB07V2Pwyi8+ZPfopBqw/S4c8nV5XL4OAUHzeL3TR
         8IQlF/lrBsejxZqjiwwZugTUJ015So7jo9c9EloyHBZwQG59hGfBZ30L+m9uE/sEIgaD
         EOMw==
X-Gm-Message-State: AOJu0Yz44dXNYNDldX0lphxyO++2ODKLqQ9aQMvyM4fqrK+Dysbht9ky
	bhMayHRI7iCAumDoTsI5+Nbuod5aZYZ8qV3rguKHKpfBM11bmZQnpdgOcIQIVoe6HgmBASXC3g7
	OlubkKNGLgVf8MkDnkhQFUG3qHUYZXr5ybLJUfIn8rZyeOWzOtk0oQRLxGrGNAg==
X-Gm-Gg: Acq92OEtQ/hMhTXi4ym/qmuaj+oMaRQgjjBYrGIh3tmH3ebEyvT4lALzBefRVpYbdTo
	M+qUGJoVl/khLJYTjMz0VJhkXdd3q6erbOXPabOEYx1343uiclXHcnnaMbx20f3jybjcGBHJ36t
	Q8wv1TLq9mPF+Cu2yu+ZHbFRhtdFo15ODFu+NLUFqritAExz6SKE5VR9WdKCZbIMPNXWm78A0Cj
	8ypIxGZvZzGDzlGxLMyiEmCwSwSlDChCu8oOsEwpw7Ol2rD0LfVCEB1xiyQRvN9Uv25CCglel41
	2bsCBlkZ1f3DouKJ8IfMbTM/rKtPSRa2zt9zT6ZUN7piu+o8/o2jiylWey0p3y/6LEyiT2kUrvn
	BmxIb7xsmJqOwGRbko7zy6NcBft0ZJ4z61VStU30qcu8V+XDfbJ1JmLNBKB/+YW4d0RkP+20=
X-Received: by 2002:a05:620a:25cf:b0:914:e3dd:17e3 with SMTP id af79cd13be357-9158a6569acmr532112885a.4.1780496539546;
        Wed, 03 Jun 2026 07:22:19 -0700 (PDT)
X-Received: by 2002:a05:620a:25cf:b0:914:e3dd:17e3 with SMTP id af79cd13be357-9158a6569acmr532106585a.4.1780496538968;
        Wed, 03 Jun 2026 07:22:18 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a238f8esm255611585a.15.2026.06.03.07.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:22:18 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/4] clk: implement sync_state support
Date: Wed, 03 Jun 2026 10:21:45 -0400
Message-Id: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwMj3eScbN3iyrxk3eKSxJJU3WQDU2PLZFNTY4M0EyWgpoKi1LTMCrC
 B0bG1tQAOf4WIYAAAAA==
X-Change-ID: 20260602-clk-sync-state-c0539c5530f4
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=l+2P1dBX81vgw2nho/fHdP1mCD8SVFm15hd0JusVrc0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIULPqCEpY906rdvy+Ot13s6IFilaDQtN88/D7LI5Sdr
 3hzzvncUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwESO72L4Z/Cu5ufB8FVBv87P
 MK+rup90UOfNxyNZT6VE0v9XH/ZOPc3IsCLq23YFf+d5W7PjxGZcvbv3fWa/nG6Yvbbd2WnLkxl
 VmAE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The existing support for disabling unused clks runs in the late initcall
stage, and it has been known for a long time that this is broken since
it runs too early in the boot up process. It doesn't work for kernel
modules, and it also doesn't work if all of the consumers haven't fully
probed yet. Folks have long recommended to boot certain platforms with
clk_ignore_unused to work around issues with disabling unused clks.

This series:
- Adds a generic clk_sync_state() callback that's initially empty.
- Adds a generic qcom_cc_sync_state() for qcom SoCs that need to
  interact with the Interconnect framework.
- Converts the 7 qcom drivers from using icc_sync_state() to
  qcom_cc_sync_state().
- Implement the framework-level sync state via clk_sync_state().

This approach maintains bisectability.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      clk: introduce stub clk_sync_state()
      clk: qcom: common: introduce qcom_cc_sync_state()
      clk: qcom: convert from icc_sync_state() to qcom_cc_sync_state()
      clk: implement sync_state support

 drivers/clk/clk.c                | 75 +++++++++++++++++++++++++++++++++-------
 drivers/clk/qcom/apss-ipq5424.c  |  3 +-
 drivers/clk/qcom/clk-cbf-8996.c  |  5 ++-
 drivers/clk/qcom/common.c        |  9 +++++
 drivers/clk/qcom/common.h        |  1 +
 drivers/clk/qcom/gcc-ipq5332.c   |  3 +-
 drivers/clk/qcom/gcc-ipq5424.c   |  3 +-
 drivers/clk/qcom/gcc-ipq9574.c   |  3 +-
 drivers/clk/qcom/nsscc-ipq5424.c |  3 +-
 drivers/clk/qcom/nsscc-ipq9574.c |  3 +-
 include/linux/clk.h              | 14 ++++++++
 11 files changed, 95 insertions(+), 27 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-clk-sync-state-c0539c5530f4

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

