Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269497;
	b=uRcFf7mPE7WwUcLZubzkswzoSj89/ipKbfGHK+STpl9mAcVhH3+Spjg9aWz2MuYS0W3V
	 GnzX/X2OS3M55eQ7/YFjWaTNlWYZ8UrU5R7n8v7xAzo421YzEqr5EDRj+un0U/WLHw/Ou
	 G4aKOf9INAihidCzsWelsowTX9byHHQmGGfBCE/LAx5r2lvyiBxAg5Q0Gx+rgqfXS3VK9
	 d+c4XUH8uyaacM+6j7BltFmbZTTfb1IKR0nt7gHo1t+758yxRIJrRV/fj1nKgzh/AjoNE
	 mkEf+YT6qn0ezAO3NroduHDfbJ1mzKtU1uuIDHHSTWSmOmG48J4e6JS8TlineFW+BMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ncQu2TW5tCLnZo3lPUMVrZHEvEC0Oe7fGakBydJIgdk=;
	b=KVr0WgRIJmb8JQxhYHP0BA7CIEMcIpIEi+OHYtHznToE2jOEzbBoSbK9VM8ayBZQ9Myh
	 46KXdkOSOdw4M5sKArm9vW0BuoNCK/Wb8c103HjCyYf9kdjZSYYkDo0uMxr3H4PxV9JyR
	 n8k640Top5tQ2XMZ9lTnR5g87u2S3pbr7tFDB9RWEe+KpXqecVmo8lBba5LC5Xjni5Y3M
	 5ljvtWAyPs8YPUsmJq/HMF1ABcFCOI0uvVz3s7AegC4B+7Sv42VMWQfQO7FLzw/Q5Rq9R
	 UoBEvfEvn/ovzJhzyI09yRJSlwuG8Wxrm6/doK9gtBNSHtf6mIY9R3PJUYd6Uwac57Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS+hPzUv;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83266606A339
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 00:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83266606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS+hPzUv
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so20436255e9.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 16:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269496; x=1794874296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncQu2TW5tCLnZo3lPUMVrZHEvEC0Oe7fGakBydJIgdk=;
        b=qS+hPzUvNNb8A1sVv/7CAjZooEOeadv/835GDyNy4FJItebptJwcI/qJxiAjrMTHMp
         +MtJYT6h60LIae4XmPVxQVRvPcVIqEIJMG9+w6QPNFTWbji9UO+kkqeZOQVf1T/nK/VD
         7AoET28Naz5GewEWfjGBH9BzPHy6ohLAVPV5BYU9Cxb+5qg5imhajzPLmiurZraSmaK+
         iN4qOVJFR8DNWfGOwu75Bh2n+4UNAWpY3OBdbbtJUNSLz+XwfQtCi6yOShUBZRmr8n7E
         7oWCj8QVgjlrq6ah/4DUt49g2MbxBpUklIpeH8xhrs4ic7b7bg/uiMPdQSlfoAg9Wbx4
         oqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269496; x=1794874296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncQu2TW5tCLnZo3lPUMVrZHEvEC0Oe7fGakBydJIgdk=;
        b=ek9gogl4pslYpO2ZfRsaco0N23x37DvPFt1qaD6YsT/OUxLfL4sWGGrnP9eWREQB+0
         KlL/Xw21Busnf2Bsh3yM739CWotjSHX1CB/m+N7y5153pv0gMQ3AsIPPpdM6PTJ8FuUh
         0HTrS21w04UTQqn+T8z5tAKKcypVfa9V0EMYfFXvFaG5s7e4kvd1pBhTNo+Vk99CCHm5
         CxkqIha3KBuMHEMfHaMQko3PT6qR6zKWsZGn3jbWURUcAdRHIcM39P6IVwt7Ny50iD9f
         2cdRXN9zFFoPKcozl09O+ODvLp6SNteOfBTBXD0LGQhOyI8TOhva4kNhFH6PbiBWqhTI
         TCLQ==
X-Forwarded-Encrypted: i=1; AL+hErFtjwiZgIx4rGIxYd1OovM3tQNk34KB2uHF4pLuPUfrEemu+xufV/xf6sUAmqYUi3ZbeNHgftN1L/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dr+njGFJh5n/3n1/Pbw5c9pxhpWHJdOB+n23g7mfOPuREEf0o
	p3IftLLLxPY2pBLo+Vj1UOLpZxWSTlkSlz4wm+XYv51pCf1Au2fV7uTi
X-Gm-Gg: AYBFou2VH1wxmaF04swYXmfRMTku1feZennqSn86uuk7VnnlAVbY/Ymh0rq6FoeiCKA
	ctFRTP09p2wa0XRMgD3zVOk23XeAVe7hX1tNdFFi8SVRLqqs2CDH9gf9ETMdUkWYJEjKJ701AS6
	KkX979FmLRPmzD5dnkelhUaI53eOZSeqWmJyUGAxTpQK9khaObTNo7OVP4tpVpUJvV5eit+helV
	HxKx6XJ0d7Hol+/k7rj0thmHD9TcjZ1VfHXVjfc3Z69nJyrCa3HIrVQbJUEZzb68uYcj8RtKei6
	Ntx2bed5/WJkdz+pI6BVrS67tUPNFpUGv8N19UmUWkUDwTWH7AaxwrgE3XpKLZqxHmN+tzQnHsw
	FFX23X/Pu/TZNLz0Ptkc9yBSlP5ewrv1hFj2Y28WCMYX8PsV8dxSdq+uWixtDmTHulKKhSLWy8J
	opZHQ19qbqtaoLXfSIntstcIRpedemnuJtd1UG1iMxsBoaaUxpIejq9l+kOPIzCzQFb/adluIyh
	Ce+vO/BdRSJOVucyK8ox3u5YrYj39diRmCLvqTEy+WmwHi33FC/gdwXzL5KWAd87sHlSfRzMO2Y
	FFwZdinTbXAuH4lCthcI4l6WZu4XKruBLWGZIad5wj0MCk5Zm2xiK+v98lwHvON+B6+rsgPTn+d
	LDlX1okfIzqHinF6Mcvmur1M63h5iYtFsmwaFf0svenT06EQVz2Y=
X-Received: by 2002:a05:6000:981:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-4982b289cd6mr1793832f8f.8.1794269495818;
        Mon, 09 Nov 2026 16:11:35 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm1779366f8f.22.2026.11.09.16.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:11:34 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Tue, 10 Nov 2026 01:11:25 +0100
Message-ID: <20261110001128.1041-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v5:
- Handle requesting 0 rate

Changes v4:
- Fix regression where base_bits is 0
- Handle divider_get_val returning -EINVAL

Changes v3:
- Rework to clock divisor API
- Return error instead of -EINVAL
- Use dev_err where possible
- Use devm_kzalloc_obj
- Revert to not fail on clk registration failure

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 301 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 281 insertions(+), 20 deletions(-)

-- 
2.55.0

