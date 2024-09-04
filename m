Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E189145A05
	for <linux-clk@vger.kernel.org>; Wed,  4 Sep 2024 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725434488; cv=none; b=rO2ku5nLlhz4ex/grxYCXb8usf0tsRyn+sSIBw62tsVhm6oWVfjpTKFWkZjaE+7iYXoT2oCAos38DwGiHqcvBlXsHYcvPpPTJz6q6c2g9Tu4B0U2DE8euK8b0/zBjgP5pSOHOkAr640uEoU406SoYEQAOkvZvSPLKuJi8Q+xrqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725434488; c=relaxed/simple;
	bh=xtIuBFj64TqzREt993EeXv6lHl7brb98Y/F5SYmD1/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qMDB4gu4sSsPcpYxU0TQ9KfMQ3IC0C4nritWWxz1VJlNDF5ASnOtrsIlR5J+yfHuOGmHgvbqJogkxjVDH4htbJyTGj+K6TYw5cszMQI3nxsIvQM93Dyj92mGqk4sGU8zB8fLDDXD6odiHvD+6/oLKNZq+ktKkSvyoEz7qSYQdx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KnPWITyq; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KnPWITyq"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c09fd20eddso5859342a12.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Sep 2024 00:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725434485; x=1726039285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mkHGl27JPuKpbUR7dPRGY7PRbaxLttTpVVEj3eSuKXg=;
        b=KnPWITyqG2X/0vQcFb8DxlNq03SI3aF5R+jKO93ReQIQetrIG+7d9kibaJ59ni/0i/
         3skSwIKMxTEf5tf7MCVzyhlMoSdRf47icuoubL9BfV51jdZw6cTMhZniz9qllIL+A+e9
         pj5+NU8fvJdT7gzGU9Rahkkbd1U0G3zPoxXNQjX+OZ5bDK8o9VubbEBj+FpDLUG76/PW
         yeQId2HQff8QBkU6g7N+ldEJitwffDppyPe8aCKH2eW++3I2kkQLrWl26Ebr6/PgOSzx
         b+0AMGwAZm5j4VGbbA/QnoGQGQk5lQG0ygKEEcfNcYmGxIHH96SltX2iAwI0OJQjy9hl
         mBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725434485; x=1726039285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkHGl27JPuKpbUR7dPRGY7PRbaxLttTpVVEj3eSuKXg=;
        b=VL3Rs9jewwhKMFGEXe6CyEVMGdVIhMCxrdI1weMHxyqVwh3pmQGJii+3B3N3PFaN3J
         4M50eicmtzEX4L6DcMMZe/g0+FBqcjagELJOY/pGw5gharlkW8uo/UZegaj/7R2mQqwA
         kA1gv/DlqFVT+LCLSEAx+IIiB3odceDTQ/lNmw1Ui2kmW0eefdRJ8LYk+l0Squ22Po8g
         qUPKhX/SV8a3WBIvgyGZCSQ3iJoggWhRoH2+J3PnvK0RM2SblAwBLEkB5il99Zqkc+5f
         sa3tJtiiE+XGUG9Tt8XdDbrY8k/T6wc1X1fEnMaj9nwzdK24ibIvQ+oIsu0eGcD/eEAY
         Doww==
X-Forwarded-Encrypted: i=1; AJvYcCUZTdeBi8QjefzN2/ICqzx/V+cQMblBYzRKYo6i/JeDOiESOhHK/KYArFsZVySc9a+ezLJ9iVd0Y6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdlVXNg38SK1d7LlMxY5D56qe7glNWRWzrgGJrQV8xlRqbFzEl
	F6MTuGhoqsrLAOwXF8g6GpH/PDj22tLrQQOUxdMoRDlKL/UCmbQFK/Zu9VhcNh8p5ycWvDgP3Ht
	9
X-Google-Smtp-Source: AGHT+IH1LQ5xqz+xe1tbnZne4HwuUkppc0/9J4/WgsiYbBiwcgFjPkLEsJKagGnCEVoDc2t9X7PT3g==
X-Received: by 2002:a05:6402:3592:b0:5c0:ad65:ebfa with SMTP id 4fb4d7f45d1cf-5c21ec58f5emr14468100a12.0.1725434485138;
        Wed, 04 Sep 2024 00:21:25 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a29bsm7238409a12.17.2024.09.04.00.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 00:21:24 -0700 (PDT)
Message-ID: <b76f5e26-3d75-4c8a-b7e7-18d9e7327eed@tuxon.dev>
Date: Wed, 4 Sep 2024 10:21:23 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Microchip clock updates for v6.12
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
References: <20240901133425.2039071-1-claudiu.beznea@tuxon.dev>
 <50577525a098bd1e39b8eed1c8053872.sboyd@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <50577525a098bd1e39b8eed1c8053872.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.09.2024 23:55, Stephen Boyd wrote:
> Quoting Claudiu Beznea (2024-09-01 06:34:25)
>> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
>>
>>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.12
>>
>> for you to fetch changes up to 2d6e9ee7cb3e79b1713783c633b13af9aeffc90c:
>>
>>   clk: at91: sama7g5: Allocate only the needed amount of memory for PLLs (2024-08-24 17:44:11 +0300)
>>
>> ----------------------------------------------------------------
> 
> Thanks. Pulled into clk-next

Thanks!

> 
> Please get rid of the clk.h include in sam9x7.c though. Looks like you
> can use struct clk_parent_data and use fw_name for that.

It's on my todo list. I have something prepared but didn't managed to
publish something.

> Also, could it
> be a simple platform driver instead? That would be ideal.

I'm not sure at the moment as there are clocks that feed the timer. I'll
have to explore this.

Thank you,
Claudiu Beznea
