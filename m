Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nEg+V7LB"
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1316013A
	for <linux-clk@vger.kernel.org>; Mon, 27 Nov 2023 03:47:05 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b397793aaso16693185e9.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Nov 2023 03:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701085623; x=1701690423; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tA3boN6EG4yS9sARU9W7D9LN4ahR4KmDV0zSEVrFb0=;
        b=nEg+V7LBIaLbiPtIHMYgKvHXwNi2+b7HjwYtp7LGjgmofHn4ps0bc/zPZ52Y3QP0J9
         48ODicnGQzPeJ6xxCxxOoS3pnUOpxpZ26+h85QamkTcmylL4kBlbK4zmTO+SA4lNkm/I
         ldD+0iKWoGLLCiaqbllKuKtBz5BwbnfigdQ+OjLc2tff0ehjZAeERZULXuzZXowcIgEZ
         88LWwHs0aQIdiaGpnL3kF7QKjY/bwqJ6kU/vDonUj6MDD3rHlci5/dKC15FaT5+wVisl
         xAr2ykvWJbdpFrEVNH+B735//7T1pTO9LFMAD1+ayQ+lm7KzGmaq6Dy554aANxr4N0r4
         ZBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701085623; x=1701690423;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tA3boN6EG4yS9sARU9W7D9LN4ahR4KmDV0zSEVrFb0=;
        b=Oqae9jaqFr2XlS1ka5mChlilADla4qq5WkHkAQ4i+7FzPnM7jocbcD6arGPr58K86r
         F+1vII8DhSAxXv9YhE9EE/Wtl+mf/ZjD0ITsor/cGT9h+rCaElfwsuA5UBbd2Njraxug
         OildA8xYg7n02iusc6auzFHpluGo73f3ZcVyoa5hTnYz8SQRoGqpedIXIa6IwKV36yKn
         xUcNtZL5MWpi0uIVYt4cNsFhcVecENLfJwnKiUfldc/aUzb9XHxaXJ710FuVSGDXmB94
         oiLKSLT79Zu6q3m+ELZIFAWMFwbN/nBlcfOFIGCk1l9Pu/Pwz9YR2floWpcrQxoXvS3b
         R+dw==
X-Gm-Message-State: AOJu0YzhTp4b+L9Je1ubK/Kp8pyfgpKEKafbu8R+576uTEZQBWtYgyAs
	kYy5zo2rMRDceccM+6QfSx6LqQ==
X-Google-Smtp-Source: AGHT+IHFHh5s3DrJkF+ahST3zPitBaks2yNwrnyWDMDsu2R3tzZh+/mmIzmyi63lGqBAWzE/QyPjfw==
X-Received: by 2002:a05:600c:6d3:b0:408:37aa:774a with SMTP id b19-20020a05600c06d300b0040837aa774amr12532754wmn.17.1701085623387;
        Mon, 27 Nov 2023 03:47:03 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id s8-20020a7bc388000000b0040b4562ee20sm1681859wmj.0.2023.11.27.03.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 03:47:03 -0800 (PST)
Date: Mon, 27 Nov 2023 12:47:01 +0100
From: Corentin LABBE <clabbe@baylibre.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: davem@davemloft.net, heiko@sntech.de, herbert@gondor.apana.org.au,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	p.zabel@pengutronix.de, robh+dt@kernel.org, sboyd@kernel.org,
	ricardo@pardini.net, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: Aw: Re:  [PATCH 6/6] crypto: rockchip: add rk3588 driver
Message-ID: <ZWSBtZAwn_58UtcD@Red>
References: <20231107155532.3747113-1-clabbe@baylibre.com>
 <20231107155532.3747113-7-clabbe@baylibre.com>
 <trinity-a0ee3146-f23d-4f6c-b29c-5fe446c4d4ad-1699797868421@3c-app-gmx-bs50>
 <ZVtVkACNHTcCjqGp@Red>
 <trinity-a9a71294-1396-43e4-9ed5-9ee2914ef093-1700838301802@3c-app-gmx-bs48>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <trinity-a9a71294-1396-43e4-9ed5-9ee2914ef093-1700838301802@3c-app-gmx-bs48>

Le Fri, Nov 24, 2023 at 04:05:01PM +0100, Frank Wunderlich a écrit :
> Hi
> 
> > Gesendet: Montag, 20. November 2023 um 13:48 Uhr
> > Von: "Corentin LABBE" <clabbe@baylibre.com>
> 
> > You are using kcapi-rng but the driver do not support RNG yet. (and probably never if I continue to fail having good results with it).
> > So it is normal values does not change.
> 
> which functions does the driver support atm? or how can i test correctly
> (and which kernel options i need for this)?
> 
> regards Frank

Hello

The driver handle AES(ECB CBC XTS) and hashes (MD5 SHAxxx and SM3)
For testing you need:
CONFIG_CRYPTO_MANAGER_DISABLES_TESTS is not set
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y

Note that I have already got several report of random hashes tests failling, but I am near to have a reproducer.

Regards
