Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688F533ADAD
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764099628; cv=none; b=EruRR0Ikb9oy/QB42FfugXm190r43iGG21KqnyZCg7mBN2mswjkB3AIG/JbwXHRS5qVhLU/VnLe/MciGHsbgMhHhlmQmWY1Z/dHXWHhjGPHS1zYBLMf93Y4Pp4u6sCEaA6CP3hg5d7aB/ROAzvfi7OfC/x662fxLwYPzlU5odcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764099628; c=relaxed/simple;
	bh=a7tR2aUFmzewMxGVoUGDSePLKdAM8cGfWal3PBR/NV0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ELG2aznL1LJREWUQXjqzx0itgn2GsyMulBq87qC/j9YqljP0/Z7Mfk2ecpMsYcLaVC8j4kY4z0siGrRY56rzIL/Y4bXNnmT6yO1PU8jJmSdeW5CBagN6GUgdfE4hqliDItajufg06EtAWU88CAFtPM7qQfpyVmBhhlqoXYAK4GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xwr/9Ohu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AvAHtIz5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xwr/9Ohu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AvAHtIz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764099625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k0kvBKlPXcvy2hn7jYiAHwvD84i8gkcKspwoTCYrkXk=;
	b=Xwr/9OhuO/UzDvLiWus4koFVI0sU8vkebs99nn+4SrHWU/k2SSaoLCqyz2QFvKAY4B6Z0u
	POMFEJ1zTqpkDNI70LcR//f+In8XOu02FeDhKMY36BCkKOK9B0zdqPnI1WyjcWX/eJZrtZ
	ktaSpi5sW1eIwal4HC/wEjtmyk7ZeLw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-h_Ii7Zx5PBu2ruQHHK9K5w-1; Tue, 25 Nov 2025 14:40:24 -0500
X-MC-Unique: h_Ii7Zx5PBu2ruQHHK9K5w-1
X-Mimecast-MFC-AGG-ID: h_Ii7Zx5PBu2ruQHHK9K5w_1764099623
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-89ee646359cso1576527785a.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 11:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764099623; x=1764704423; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0kvBKlPXcvy2hn7jYiAHwvD84i8gkcKspwoTCYrkXk=;
        b=AvAHtIz5s++Y+nFinjIjZPAHWmnSX/dOZ8LaXVP/QmiAKnvhbOrMvh4kV/HQTTCi5p
         QooTFxXExIQ9buBpU4R71zuGHpYudvTN2xx4EIKwLOezd3oXQgqMo1pZJi+IFRl7+j31
         6qba7teiFr4mN4KD9FCSHz0TQo31TeeBOFBtDNUJAPtOATNi/AJWB14h5DbK9EnMdYes
         s3E+aIww71DpLtFtjs1HqrdomcoYYHrlHudHYk0CbPN4OZsbczqb8NzIk1WNfjGz95WW
         ZSueKNkLDLdBd4eP9/n0K9XfwHCFVlWYRsbV0+jzCEup4a13ZIuKAyldKM2ujOKobBU/
         abfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764099623; x=1764704423;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0kvBKlPXcvy2hn7jYiAHwvD84i8gkcKspwoTCYrkXk=;
        b=gmEYFxheHGYsj6ZchDQ1Oc7TyR92JbbsmeS6mNpLyfy6qo/WMY2q5f+qK24F58NAde
         cFSJg5U9suS3KgijKu+WIAu1rmA1iMuStiklsJqKiuQB/FGDgDnVMPzbVpECIh55XdjV
         bLYi7Ny1UzjvgU6W/6nD97oGNxuYoMOTuxSwfUbiMY8m29QTcrE7Qp73xJxBKhPFzNoz
         oMtt3PPSXNT8M+j60PjVGkiBwM9HfhxH/fymKHdBLjcB8yM63eqRL3ZjojTUno/ZwbKu
         ultqbQ4iB+OdmD6MnqaiLJ2bByyOI/wsX273bK8h4O3EgB8zoxsbSUIaY8XLHpbxJAtS
         iwGw==
X-Gm-Message-State: AOJu0YyTBW1VEUBn9FoyBhS4gt6+5cthV5fyvSwclU9Yf9IcJnNZbyJA
	ifbPvKcaqQlfijrehoE2cVy4inI/zKX6ift3k3OtY3q4snBLL2QAljZeUJapBHby5CiMCTq27F1
	wlymAnJ90sJg0M2K9txVN+UZe9QSiti/wwTfEpvwpvojYUiJm0CCcelC9C2X5tQ==
X-Gm-Gg: ASbGncu6icCukIP2z+SA1lVwbUGoajg8898wLtjQycRdgEl0TPz50wEf8ffSw9USXAA
	NWY/MO03Nu+bU6IZLOOvsX28Jfz8POHL6ZkEOUIPxyFxKuxI13E4uh8roPi4WCb3APIgghBHpDQ
	4hChl7R8mK8Mq/vQyj0+/4irME7/i97LIZihVltef5+pPo6dLnYq/vs2wGbj/iXN/4jSvRhUtTC
	TXIjZkmYg95bK6LMJJm/9i05RDGQd1tBf9iiZlqDTFrJ5zEvckTxO06U3Hv7tp/zXMz5bh952Tj
	1qxkbN0nB8IBZcPE9RyMDQ613mM3w/jnZI0rHtS4VvOWsnNMf2XDyNGAufm5Ofa7H6h1ME5RiFW
	Qlm+1yX6cDZSWID99E0t0AT6+sj6voe7qT6zJSF/cpLrftb3n
X-Received: by 2002:a05:620a:4094:b0:8b2:77aa:73c8 with SMTP id af79cd13be357-8b4ebd546aemr575925685a.16.1764099623465;
        Tue, 25 Nov 2025 11:40:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnZHh3BpbNtZTVIwntrUPl8XGOJK25ofKbltiuy2DfYtrwQk6I/nh6FLo9Jw9uzwPiDw1MMg==
X-Received: by 2002:a05:620a:4094:b0:8b2:77aa:73c8 with SMTP id af79cd13be357-8b4ebd546aemr575921885a.16.1764099623027;
        Tue, 25 Nov 2025 11:40:23 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295eefb6sm1236272485a.50.2025.11.25.11.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 11:40:22 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] clk: microchip: core: fix issue with round_rate
 conversion and allow compile test
Date: Tue, 25 Nov 2025 14:39:53 -0500
Message-Id: <20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avIrBtQyYiuEi1CxxwqC4UIxLsnL
 R+fXyBTYsowiQKJHs58xQbVCbBhjRshu2bQUhultEF77HiyTZcNfKPnlzI6OQ49aUVeOmjnneg
 PbZyXWj+BzijUZQAAAA==
X-Change-ID: 20251125-clk-microchip-fixes-d0864e21ef0d
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=767; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=a7tR2aUFmzewMxGVoUGDSePLKdAM8cGfWal3PBR/NV0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLV2ORWGTb2XLwaM7PloR3Xk5fFG9dHZXoIGYfu+HM3u
 bap4KhLRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABN5MInhn+W8rLYz1d5z7ObL
 76nhMtpydp13pNH8p89fRJs02LHvns3wzzx2HtMME6upJw8FH9Ypy9vm4LPZ2k9u1ss9MUeF0xf
 PZQQA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a series that fixes an issue that fixes an issue with my
round_rate conversion on this PIC32 driver, and a change that allows
building this driver on other architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
      clk: microchip: core: allow driver to be compiled with COMPILE_TEST

 drivers/clk/microchip/Kconfig    |  2 +-
 drivers/clk/microchip/clk-core.c | 20 +++++++++-----------
 2 files changed, 10 insertions(+), 12 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251125-clk-microchip-fixes-d0864e21ef0d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

