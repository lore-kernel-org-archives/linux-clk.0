Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD3330650
	for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781854196; cv=none; b=J7NsRqzZsWNpBShbRzTedfTk970izyAofPYibRDOpaI580NmmiJMi8JO7lXlZiY7Nc26u2ySRiX0WoWOt60GRp8OTsDhailqCmx7QXRGn5+aL2ljqsXEfnJbEsbwq+L5ZFaRLdXui61W3APfn93MJiQfXSaHdE89lddRrrwKvW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781854196; c=relaxed/simple;
	bh=XBcuO4HXyLC72ANXStPSUqeOoQMNYhUkr4zFsbzLeBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f6Asy63QXEELtH9W8lcF4qd3Dr9FEvs2ycvSoU7NUTZ86kWWsxJY7HuXVhZgZi96O7SpfO6TNRkalk7fZ3E9KC5iONxf+QmTWLJnL3PTSLpWKVmstQC1d2Xjqbh6umfuJ/EO+yYVYhq88J1pYmpRskiiUGU3wJdzqQRShK3B1L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZqsP797F; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZqsP797F"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4923139e940so10283575e9.3
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 00:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781854193; x=1782458993; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPDHyNrMcgujLZEScT9ZWB7ZjuOqeA69xZgdQn0M0M4=;
        b=ZqsP797F6XLkR+rnv544/0Z2J9AHZEidCvwksOT7YmqlfRDsDnrlQwaSdz4iqjmfue
         6pxQa2rzMqRnOZIUoh1F+G/hjjYhhwIprse8jJGHpwhMvy8ZajKNHWz37QtjZvRr69fY
         vNe8e13khAYZ7nXe4E8kpi9rlNUdt1PBksiKnX3R26ItgYlf6u/45BViaEyjnpAS0GIy
         5zH04LAVoOYIYmio4MQJ/F3dZ4yJNBUsCrMxxBZ2hoithQJqH7r55Zzxb0NNnvwd9YCG
         avRzGJumv01XjvB4mCZduiYsDGVTPo3Q+GhQG2xGz3elx8wuQ6WajvBFcuAch1I5/KAs
         4XLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854193; x=1782458993;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wPDHyNrMcgujLZEScT9ZWB7ZjuOqeA69xZgdQn0M0M4=;
        b=GS8nYPQDvv2AgUXCKLngAjJKuYJS2g24yjmQvO8IxhTfH89ZUtTB8e9oyHzico/8Ek
         hMc7oOg991aO6pyH2Us8WV8NlKSqUHZ96UQKVH6PStS8MOo/L6vsKNEDl26dRcwpXb8Y
         GCA7A5QBiK+puVPDX+HRaLEWgTbXn/MTkIlO+dJEZQcsdJUC+eDiUNRneci09C081VCI
         nGpVsDVpmtS/jioh6R3JZEfdVTF8GRso0sHlStoaG4+WepQ/EP7Fc2k8Or7TEfbcKXrk
         HRooH3plh8eanpesYSkuFG7nBU7UNik5IEECb/zAmrVfGJ+4gi80vBNtY8BqkqcNqJeu
         2hhg==
X-Forwarded-Encrypted: i=1; AFNElJ8/9YtgKvf9hC6S+hQr1buew4AShmDZtncuLbmxSSYu7vIhT/bMgwimQmNXz+CM05AmKTdT8kDb6Tg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx948dH/etb731ClieglvK6ySuB7oxdrDf4PTXWY5ZK1tWT3QWk
	gCONbL1a7tzdIneAqa/8fGjoGSfY/GCi9dLM4XeTfJPmhCP5YS33kxDXIqD0/+Ewp08=
X-Gm-Gg: AfdE7clj8vw4yKPN8HcS3PdJtcDrYuehapwlWlsWEKaXRWYdcJN+CuhCrDSEt0oPAl4
	lITqv+heo0sBQlpchGcf0ux/6gkh6zA4nJ9kfUDKl9FjvjEGXk31dT2gONyKNtmLDkpyyyuF9+w
	IFEGe7WQL91YoFVFf9Y+HLER6YVYV6QSt6GycSpMO3A1vExPQpt4GnZWDY2dhDSHewsBJ6+Qh3m
	gzFzhi6y/EkIsM9XdtJ6zWtYT6207B7CWB86Tw4SP4ReoMt32vAT+nBbwrJAKPVsoqTwX55KxGw
	uGGvvOULmlfnXqf8OW4cFpUsLBOeSBT4ur8scGhdnsjLgq3igDOCudbFxL/lG/Zf5lJKS57AGCA
	9xGt6LxIk6nV+9dvNIPfbwty7Fd/aapuKDwTpbv5Cgsm852znugAcVETaagaL0Anyht0kFW9NwN
	+BNWubgjFqkuI=
X-Received: by 2002:a05:600c:46d4:b0:490:b58b:a8ca with SMTP id 5b1f17b1804b1-4924257c483mr21687735e9.27.1781854193037;
        Fri, 19 Jun 2026 00:29:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fd30078sm46219025e9.7.2026.06.19.00.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:29:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: jian.hu@amlogic.com,  Neil Armstrong <neil.armstrong@linaro.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com> (Julian Braha's
	message of "Thu, 18 Jun 2026 19:56:12 +0100")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
	<20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
	<79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 09:29:50 +0200
Message-ID: <1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 18 juin 2026 at 19:56, Julian Braha <julianbraha@gmail.com> wrote:

> Hi Jian,
>
> On 6/18/26 10:49, Jian Hu via B4 Relay wrote:
>
>> +config COMMON_CLK_A9_AO
>> +	tristate "Amlogic A9 SoC AO clock controller support"
>> +	depends on ARM64 || COMPILE_TEST
>> +	default ARCH_MESON
>> +	select COMMON_CLK_MESON_REGMAP
>> +	select COMMON_CLK_MESON_CLKC_UTILS
>> +	select COMMON_CLK_MESON_DUALDIV
>
> Selecting COMMON_CLK_MESON_REGMAP is unnecessary since you're already
> selecting COMMON_CLK_MESON_DUALDIV here.

No, regmap clock are directly used so this is necessary.
Relying on other module dependencies is not enough

>
> - Julian Braha

-- 
Jerome
