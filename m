Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53B341C0CB
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 16:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468914; cv=none; b=dQg0U77wiJi7b8XuYd6Y894JAYf9REk55ouXhgAfgk/nUjwv70bjNBdYCfUgS87+PbKkKjloLzIL71sl4ZThw51Xs8eDTBLz/rjhMV8CJ6vj+eDnWd/zZPMd1QR1SOhEQLBbLlvd8GvI5b9Yg1o+cGeGBq7QH7OKKhzEY/60ljo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468914; c=relaxed/simple;
	bh=uBx35spdecr0Foh/80vdl9yoCBDNS30rMaVxtcY9Jps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZ1Cmi6y5kQ38K6vmcjqTSx40pSWv4HJK8Whd1E6msttSq5gB1l40U/sMghijnm/0MF2coXj2Ef2AmcKvyLfIyylVLxSDIh54lEYjXvGwq0rc9ZSZf4CDNaedP+gXHu1MHVtHQuayLxJ693w4sAGBNJcuUEdB/JZn/oJrolmTuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A8qCg0m0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A8qCg0m0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so52849635e9.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 08:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772468910; x=1773073710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzwJxqhy0QNK9BireGlunz30/kBwTEVhSwOAZ1SWJvA=;
        b=A8qCg0m0Vidcv4VeF9WHMvykAbOo0fEO+KGUIOqQghcHNPObbQKHWFro2kkwvNxsKH
         Mg3kP3yBKu6d0oUUeYaC4IiuA2rqpRrnJttUdaipGB+bEIua87z7b8N7OUatWK7c67EK
         OvamKkoKhw4sVlyhAnz3HMwH+aRxNhAJxmTb8BluWU3YExHdEEYG41sdcRH/aAeCe/xU
         140MLlkuWbEc4SZWQ0wxwN1Hguy0AD+3qzmT7p+KYFL0fYYJBhWxA+QGJykJx3g+/cz7
         s0M1TpZRNLUNguM61fU+YLanlxpFJk7QsUY2ZL17cv24Q13F+DavF4lePRwL28PpaQqh
         9yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468910; x=1773073710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzwJxqhy0QNK9BireGlunz30/kBwTEVhSwOAZ1SWJvA=;
        b=f/ZrZVxjAMlrQlJFoLgG6rEAg4pvK83D/Ruzn4fsOCi/byGRX1/eJQhXAqj/YHSNur
         sOEyc+sjnGX3fw7XlMAlY9qyrnrYhKw0GaPO/+Nohm+esajvwTSfXgVK4t8q6+KXKwYG
         i3HYHT0ycySXlzCaqtpDHC6gSG2ikBf6q60/SdMfgVO8voUiLsi5acGs7uREsKruyf1x
         Z28EdngEV4Or2aIR6xoj3QXn6l/miJbVy3zW1nJsbsCKUTjFOdf8HPED4862N/OMOyy+
         AP5ROPYKmwSK6djJsJ2cBGl64vaphgSmlaR7I1IUU7qS0Qt6WvVYC2yGQ2Va65kpSXW6
         RBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1SEKLmvCY38nqHIK42HcOHlUVjvVrE+fMZvn+K+jMAIOcwYhfA2nYK3Alg2xQklO/TtWuexhv2YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySWquQ2ot/w5XSV8zKRbu+TnZFxVXVGjDA+iUZn2tBj0irFNvW
	eCL/TCTydmmrhK+t7Ij6zlLxv45lRb6nOtFovu1l4VywtNkOkq91hXup/e6YaWiw+RTi4GsOq/r
	eDgTG
X-Gm-Gg: ATEYQzx13hpavWb9AArwo3LuWUV8q7H/LhbTL3QCJK7OUuW2SY//I9n9dPLjy324Yje
	4kUYSTRYEtgzmvhNV0UzY62wsshyuXKb8JCKEy4nKRWPE4pwr3EjO1brNoDneghWs27MRHMicWq
	OKBJ/1/yo4YS0CzBbFaDsUEseZks765Uot/DsbatIZEucUaf+g+WhBZhtOiRfdlMphNbzYtqrJf
	/bdQMXK5YJel9R7QkqtqAdybQyZHmUEyg5OKzdUmSp7kfCVBBJmjioKZVzd20ZXd7g+NfvvR+f5
	K6MVayrpwVUN1yPccQQJlQtKnvP0rMEwq9Bb98cEWLDztcPsxF5nU3FI4LU1Au8yPwHuMUfaEwk
	LRagr/XPbFZsaAUPl1+3vprZmhV3OgIzVdATTc7UgMSXW/kew/ebT3TEqgYpyZerS+1Cq5rL1aS
	XSuANh06ETt1b2fjW3vEtYcpXkO+rkuVwVK3Ce
X-Received: by 2002:a05:600c:3486:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-483c9bed89emr257432255e9.19.1772468909910;
        Mon, 02 Mar 2026 08:28:29 -0800 (PST)
Received: from [172.19.170.194] ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e6c9sm366337995e9.8.2026.03.02.08.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:28:29 -0800 (PST)
Message-ID: <a22454c4-637e-4114-b43e-fa8cb1363cdb@tuxon.dev>
Date: Mon, 2 Mar 2026 18:28:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/15] PCI: rzg3s-host: Add SoC-specific configuration
 and initialization callbacks
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-10-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227153236.55988-10-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/26 17:32, John Madieu wrote:
> Add optional cfg_pre_init, cfg_post_init, and cfg_deinit callbacks
> to handle SoC-specific configuration methods. While RZ/G3S uses the Linux
> reset framework with dedicated reset lines, other SoC variants like RZ/G3E
> control configuration resets through PCIe AXI registers.
> 
> As Linux reset bulk API gracefully handles optional NULL reset lines
> (num_cfg_resets = 0 for RZ/G3E), the driver continues to use the standard
> reset framework when reset lines are available, while custom callbacks
> are only invoked when provided.
> 
> This provides a balanced pattern where:
> - RZ/G3S: Uses callbacks that fall back to the
>    reset framework

Nit: This fits on the previous line.

> - RZ/G3E: Sets num_cfg_resets=0, provides
>    cfg_pre_init/cfg_post_init/cfg_deinit
> 
> Add cfg_pre_init, cfg_post_init, and cfg_deinit callbacks to support
> custom configuration mechanism in preparation to RZ/G3E PCIe support.
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
