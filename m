Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795497884;
	b=Hb20v9ja8ZfbpKSRYvbwCKOtatowIbFQ6Qub1427AfzXLXlCNG5eph2bsctmK40hzM24
	 OOvnOhNsAEOHhwXDKCq1S6z3fEMp4HLs91TgDbJ3jBIsLlsCgoKq+DkMYOnwtQskl+0OP
	 TaXtzvV0Eurt9R98th8SrnsriL4EhqybWC+0sSegMn5vc8hQubEmmIDWHI8RZcSMbOEwD
	 6V/XEErePjOwNvHVkkO8/pqwlnPAccDf/8UV6i3mZuIuMLaWHkPsm1Tj1vDpO7ZqgDqIx
	 S2bap8vR8MPMebuvIZeZ0TQNZ1SsjfU6Yc16bqPoEtaurq9kUMCQXK4wAUxL9M4US3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795497884;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QzR4znUpHkFQ2LRl3l50Okic0JbJkrnumL2Tbt7Auzc=;
	b=IugbCbHasBZaVjD8eUGH8w7mwqy1ec4LyOqipeNnbnFSuL7sWy26rNKKnftTmR0Bg167
	 UJpOm3Zubd28n8sT5Ytq5l6bRvBIKb5nYLE5l4U8MenYt83VHVXGMAnib+AQjmoISTmF9
	 eujXf/Z9s+0Iif2p5Gp/APMAccu7r6qMc6spzql9jeHsZsZRjxuiPJrOvTrW9vmDURv0K
	 RzHjm2SBdy5angzbGP0+s555fN8236na3tUN0RrTxKJUC7Unr2d3T+qtlGzpXyEQEw11W
	 /e3YLT3SyjsXILwlcaEfiG1vI563aHAcDO4kEiGXAd6645OFZycVAYZR6/8sMcqqAJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651F1606A321
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 05:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 651F1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67da62357acso5437995d50.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 21:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795497883; x=1796102683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzR4znUpHkFQ2LRl3l50Okic0JbJkrnumL2Tbt7Auzc=;
        b=MjDVppBnZvqTYnkiopp4p+nYhGYTL0Kr36lTxfZ+SUCgM9TYhL+4JjIZsLv29gtS48
         /Ypoo1UxvyICv85iGD2PcjQUcZ/k0GH+8iebCQPaBkNmpwejS6Ob+tgHKeBehC7tr2eP
         zjn/S2mxwLlvupNp39tqpuUsf7OBBuwr1RghiYFRt7x5nSrWwf3b+S5DNZ2vmevcP4ai
         tIWYxeUa5IIUBmU+1Cho5DI1zU/yKa+ECWJuFNh/+jOtIqgWcjQpvEy/YFhX57k4lMzW
         VQLY60ckXwtQkONJZiN/ixyI7UCOQnvEZQAf1u1LzISheDLWOw4eQbizgRQfuX7hjdq6
         V2JQ==
X-Forwarded-Encrypted: i=1; AL+hErFa2mPWMvX213L4IEJ1wDsUhCj47LsO43nCaDTnbsUnx7YOZMH+rjMPSGIluPs7kn4ydcNGREyr770=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zxJd2YbD2dIgNhAyexitD4JCi0HJTCoecjEcBCgPG6GRahaO6
	U2eYxxKCHh+BYgjVEKnmkNrXb4/5YLkfSnt3gvfvWbEWcSlZ7zEjG2e+
X-Gm-Gg: AZFdTZdXqkdNm4eC/MRbCQSF0gVtEHMRTwisZM9SVI81l+fy1RNv3Yy4cIZmWGUwLdG
	RKkYqAVP0NfuYe6qgIIvDOX3ftvT7Ja/sLMewuCoXPinhBMXomHHFN/lEK/eJalVdqeXeo/nZMz
	HOvyY0BxKrFegd3Z43ZTae6bhHP/2Ud72SOMtptNVx6W+TsARRqIykKJFWS+41ZMQecBf9D1nzX
	uPAzRpyim80qa9e4L+ATGrV/vo/NESf/WbVltN0tSFa8bwSmCrAga72CQYoTsH/Z20bg1ud17TQ
	CKto/mF8qSHRLwbivqeiPei0RVEHbfS1w3JIlDbSw+0XW2M6b8QPeK/zoDuke0S57QpqUlo69eB
	eGj9tI4a696mO1gdEsKm6w6/fmz575ecEWII3o67GrwByNYULdxHDUtY0PcpMoj73nX0827n1Nn
	uAngIkSjOLKi+KZWtwLDivN6IhHdsEKEETOw14JrPPWXKhoDLg3qjZ7V+6bKQVFo8ALAUhoQCyn
	Itr3CvMsOQhFF3nVKGCXblAbbgNOL8V2I5PLxdjiu4y299RVzNmL72uYCnaUZI6gJXboIi3AiJq
	BxD674EAW4vN+WNjMWar2vKD6U4K58t+P3Lyj27s6FOjBB47YGjPfCZEnqOS0leePQFmByRB4v6
	ajVHZuhLn+Mm1KR7W6zhei4pGHVnSVKnk8rfqEk86YfghOt9+Z/qw
X-Received: by 2002:a05:690e:4893:10b0:677:d1d9:127d with SMTP id 956f58d0204a3-67df45025ffmr3481264d50.100.1795497883474;
        Mon, 23 Nov 2026 21:24:43 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df335b3aesm6545977d50.12.2026.11.23.21.24.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 21:24:42 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: sashiko-reviews@lists.linux.dev
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] clk: siflower: Add SF19A2890 clock manager driver
Date: Tue, 24 Nov 2026 00:24:41 -0500
Message-ID: <20261124052441.50277-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <sashiko-outbox-230534@kernel.org>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev> <20261123-sf19a2890-sysm-v5-3-4ba44a0db17d@telaak.dev> <sashiko-outbox-230534@kernel.org>
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

> devm_clk_hw_register() runs clk_core_reparent_orphans_nolock() before
> returning.  Because data->hws[i] is still ERR_PTR(-EPROBE_DEFER) during
> that call, any already-registered orphan clock parented by the last clock
> (CLK_MUXDIV_NPU_PE) cannot resolve its parent via the OF provider and
> remains orphaned.

No clock in this driver has a late clock as its parent: the muxes take
the PLLs by clk_hw and the oscillators through "clocks". An orphan in
another driver that looks a late clock up through the provider is
picked up by the next clock registration, as with any driver that
registers its clocks before adding its provider. Nothing on the SoC
runs from the NPU clock. On the GL-SFT1200, clk_orphan_summary and
devices_deferred are empty with v5.

> In addition, of_clk_add_hw_provider() in sf19a2890_clk_early_init() calls
> of_clk_set_defaults(node, true) while the 17 late clocks are still
> ERR_PTR(-EPROBE_DEFER).  If the clock controller DT node specifies
> assigned-clocks for any late clock, of_clk_add_hw_provider() fails with
> -EPROBE_DEFER and tears down all early clocks including the CPU clock;

Right: assigned-clocks in the controller's own node can only name the
four early clocks, as with clk-eyeq, which publishes its late clocks the
same way. No device tree sets them there; a consumer's assigned-clocks
are in its own node and applied when it probes.
