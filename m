Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6EF1A8;
	Thu, 16 Nov 2023 11:23:32 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6d645cfd238so665307a34.2;
        Thu, 16 Nov 2023 11:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700162611; x=1700767411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11ZdWcm9xn9/03dHAna0VIYX27sSKjstDA9LwDlSCCE=;
        b=WAdCkhEzQk+We1ZpMM7aFrlB9lO2C5OlJ3wU21Ptnnw2BL8t4nRfmnVPWViNyxbDDx
         v7KA/wo+ZUE9PlWLX5IldpsJF0nAkTSON9knm0l6fp35JoGHUJW8RIjxPesq6MFkvU7e
         p1gyE/Zyd2aiKY/V65OYBuni8g1/kTdfCW7k2C3LVq843HM7b4ndzjWW/rLmAT7v3/Tm
         0q5zp+FDKGMtsuibltN6W7h/pUjp5iV00Q85avv+Uh/o/GSUSV6xFau+kqnLFenvcNBc
         pbwEoJYCqtTb4zVFHtCGD/iGg21XoNLgHKZI9cQf1yUdA9JUDk8PZnAVa2p89HlK4695
         XTng==
X-Gm-Message-State: AOJu0Yx4VxPm7wz16hlxMbtWui5wIW5MGkDUZ72oIFf1dYR6DJb+wKVQ
	fPiMGKG8d5Z2+1lsdYVeOg==
X-Google-Smtp-Source: AGHT+IFFflHQDgRWcv8Aa0Xfi5zkFhUmKL2WYSX7jkOBDfAipGIi5WM/EhkIhHPanJyZbmYMTEsu6g==
X-Received: by 2002:a9d:6f8c:0:b0:6d6:45b1:faff with SMTP id h12-20020a9d6f8c000000b006d645b1faffmr9490888otq.30.1700162611533;
        Thu, 16 Nov 2023 11:23:31 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bg22-20020a056830361600b006d309c126fbsm1006744otb.57.2023.11.16.11.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 11:23:30 -0800 (PST)
Received: (nullmailer pid 3022585 invoked by uid 1000);
	Thu, 16 Nov 2023 19:23:24 -0000
Date: Thu, 16 Nov 2023 13:23:24 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: Re: [PATCH 4/4] drivers: clk: renesas: enable all clocks which is
 assinged to non Linux system
Message-ID: <20231116192324.GB2821275-robh@kernel.org>
References: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com>
 <87wmulrynq.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmulrynq.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Nov 14, 2023 at 12:01:14AM +0000, Kuninori Morimoto wrote:
> Some board might use Linux and another OS in the same time. In such
> case, current Linux will stop necessary module clock when booting
> which is not used on Linux side, but is used on another OS side.
> 
> To avoid such situation, renesas-cpg-mssr try to find
> status = "reserved" devices (A), and add CLK_IGNORE_UNUSED flag to its
> <&cgp CPG_MOD xxx> clock (B).

See Stephen's presentation from Plumbers this week. The default behavior 
for unused clocks may be changing soon.

> 
> Table 2.4: Values for status property
> https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf
> 
> "reserved"
> 	Indicates that the device is operational, but should not be
> 	used. Typically this is used for devices that are controlled
> 	by another software component, such as platform firmware.
> 
> ex)
> 	scif5: serial@e6f30000 {
> 		...
> (B)		clocks = <&cpg CPG_MOD 202>,
> 			 <&cpg CPG_CORE R8A7795_CLK_S3D1>,
> 			 <&scif_clk>;
> 		...
> (A)		status = "reserved";
> 	};

I have some reservations about whether a reserved node should be touched 
at all by Linux. I suppose since it is platform specific, it's okay. I 
don't think we could apply such behavior globally.

Rob
