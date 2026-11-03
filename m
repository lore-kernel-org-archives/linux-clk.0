Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669603;
	b=hWPKoMqbBipj4WiOfx1RzR45D2T0TfWJIYiIgMaXP7YsAlcYezzA/RtC6BKaFDVwTBN1
	 v5DwVZHIO4vLBKYyhIbp5Q8ugMBJ7bYBBvAHxCfaP5AD25KOjCa7ZYaBxEbXLN1seZsj4
	 yaEwC53KanN8ckWug/KTSRdqNbqlDAvuD11nahCdrZeV/jedEzG5FMYhgPxQoJq5V93ES
	 v+1tfKL62WROQRgzZl3KHtaud1q65PUdHY8wbwSBIr2luB1V96cejlFjpQTtic39DcXR+
	 E1GlhCdwqgLhWb/webf5hSLrav43YK8YpExT2F4rK/WhWC+iEHvWp/oTUwBzX7Hu7SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
	b=vnexfPjPx3Ho8UiuSR0o3x78zm7Q5OCLPW4eGKOeHRcrvKo7RaFCkSm22jdZ7Ha2TZ6O
	 HwCAYxBgmnpgjqU0DXj+mU+mEcIgD9IyQ4ym5ljgw6wNpWoDTIp8gUypnGcvj9Qmp5KFC
	 4FIi50J1AAsjzyyMF7GpYJPJx8LP5Fz/TM4LRJTm8K9r0RodeZAXjEQWONb//B1669u5E
	 yE/q5xypWoNVlEflVJYVupjWRNjOkPVk9sGNpxuhPPZrDlx2/FwQwzPOOnx95vkXtvK3v
	 6U4AzMGF+oCL8Yp0wBViEbw5hfQVqwuxHkwY7+TeDzXetu4JxFxt6rMNAAbxNVXyeGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lgQNLUCB;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C00606A324
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 01:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C00606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lgQNLUCB
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53cd0c8614eso27779401cf.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 17:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793669602; x=1794274402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=lgQNLUCBm2WQLGp42iXbCrYUYAs+Oi1wVQBec5h/3veTVceezeaAU3WIEwWPr+U02d
         2Jqta9KhYiNZ5r+wA66ORykt7/O7EX6mrYjoZugMnQI7BBKjwaiVlvqOwNxSpFc1mjgP
         Ki2FVx8XpKUdDwqV0xTB8ZONiEDPLqzP1RXHyn/vks/Ch4IOszlHvCLUvN2xnAjHDWk7
         P8XZW/UPtjNtT0I0GsalpPdLtMTO5gXSvZJw063l7KglxNmgIGM8vHdEEwyE0YPMMzQU
         Jp2r+69MahJzUyJv/Oe7B5Qpy0VAEJN+nXt9nO0rwgNMDj8fkMFV/odObkF+WgrigCIf
         smsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669602; x=1794274402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=VVU6ozAN657vPVb1+vzuulit5M6o9PRSGYmMpbuPOhiO8zgWWvH8ZhV6uYk4xBhCqr
         0de89kmYCWQCGlnMfjnPkcUntRsxWppa+OJCSjTbN2CTqVuf+Fjyit8iQ6N88eL41egO
         OfZHcgTiMXkLif1YJaDxJGUSVruAhJWejxAac+HlZTAt5dQrK2l3aDSyVDdHQfpPeF/8
         rr4vvRHgZ0a0hm62om1bxUvn1r1PG1ivL2IDNGoTLrybaUg6T1UE48udJEV7pBxBX9EE
         Eh1yVUT3A7rkd6aY0DuBcc4kPbJYkpEJIphoeAhfBSsI+gGRWld9LVHUZWr4pkaAaXLK
         3yuw==
X-Forwarded-Encrypted: i=1; AKwUvBw+a6WF3tKbg31ynz80tLFKpkUiTJuGLSuJ29Se6tR9QM8R+x9kHvT2HDR+D6zoVwKksSIyfC7+l+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQsDhf8VzCKFk6BVkAE8kWPyFYh9kZSMdANgF5WxbEknw8hDnV
	ngqNsmlC04HOajzTA3vT/YDIjOm3P8UIkTU7OISB931U5KH6Zatv9zOk
X-Gm-Gg: AYBFou1aZSg2TAKs9epZNr6HG8n1wTrht8BoYa5X3seAjbqzMkHjFH3pd3IyjW6w6c3
	1S7DSFpoBLkGRpLJW9l3VhXAXGUVlpQensP2QPPFEU0lNipgoM2PSeoe1YAo2j1amty9GhBNxr3
	X0l2f6X5rMqS/TpuSd4tRSev/vqyHtC46irDPDVczwZXB4S9V7TzpL8lPDG4+OaIo0WJQDIUrQb
	daMrzD03+wj/UVA6dcHA/eaDjkGKn2PNqBRvqRncx95Ll3fZyLOcnaMWjnfzf48gcsWnifN97CS
	E64RJLhUYq2oym8iaJfQDV0jd5huov32GBlx0uicNnhNA2JMSPsBbGc/T2CUP80jyYsHPirp1I9
	7gux6Fud6Dbdo39wKNhJDi6t1+RzlxYLHNMZMU/E8YDuDev8ZczyrjrL9SbWaVTooEamH8gMW/+
	w286Kiya9dSdkWSTC4VV/4D0QnXIEeH7wyGuomHA7qDwexXIP1Pb75hjiwwuBLmi/5GAbHK5z6I
	UTk7CpY7Qh7zr1b5zP9e+lpQfowKtzNztJPZtAYZlqD/nGrKFgcmvQWR32xQstSfd0qNuOgWpLN
	tPNLluqhM/j+d88xj5vQpFMwl6hIK2q5B+bXMNdLaw7hQ3qYjLHh5LNVgT0SihnQ7LbUfC2eAlP
	gQu4dTcubrKR0NPTo9QsNk1SgSQ==
X-Received: by 2002:a05:622a:3c7:b0:535:5fa:ca6e with SMTP id d75a77b69052e-542b75236b4mr201626151cf.51.1793669602205;
        Mon, 02 Nov 2026 17:33:22 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498cb5b520sm12746021cf.26.2026.11.02.17.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:33:21 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Mon,  2 Nov 2026 20:33:19 -0500
Message-ID: <20261103-a733-ccu-v6-fw-clocks@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

On Fri, Oct 09, 2026 at 11:52:08PM +0800, Junhui Liu wrote:
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),	/* gate */
> +				      0);

On a Cubie A7S with vendor boot firmware, v6 reaches a Linux shell but
stalls at warm reboot. The system-controller firmware uses the R-domain
timer and mailboxes without Linux clock consumers, so disabling these
clocks as unused can leave its services unavailable.

Could you consider marking r-timer0, bus-r-timer, bus-r-riscv and
bus-r-msgbox here, and bus-msgbox0 in 7/8, CLK_IS_CRITICAL in the next
revision? My standalone patch has the diff, firmware references and
board results:
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com

With those five flags, two RAM boots of my A7S integration completed
warm reboots without clk_ignore_unused, and all five clocks reported
enabled. That is one board on vendor firmware. Vinicius reported native
PSCI reboot working on an A7Z without local critical flags on
bus-r-riscv and bus-r-msgbox, with TF-A and U-Boot built from source, so
the boot chain may matter. I haven't tested suspend, or shown that each
of the five flags is needed on its own.

Thanks,
Enzo
