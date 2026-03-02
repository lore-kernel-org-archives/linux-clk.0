Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C44266A1
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 17:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471276; cv=none; b=Ju+dBFsRYuEWodLV1+GWgfHLatM5csvqa+dHf1VIixcAVDi0ktUCrAaOAgznbeangwtIk7yVpy5A8GZtfu8Knyrxe78nmbe1AeeOAhQq6pYqBT4x06DMJuU8NRfuNNX65lBkqTbG3C6EbSvWq4BiTT2o0A5tGS2CgUO2Brs7Rbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471276; c=relaxed/simple;
	bh=jIGPOc+FfJQxokBbUZuUkvPWYl6Uf9OBDLQ/zpqAsZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sp9WxKngPJWtp9rMU3I2qmW+MgcZtYcQXVW+Z4jcJ/KeBeM8DVKe2E4RGERUDmhgF2T1SY1fwApRWTz0lK9K6Gh49iSuYrKpxKzF0KEHATa9dVR1gHlGYVQjglVoy49ucU/sQhcpfXUh7+PbX+nB+ck0AUIHuIMMwPoBLJIciY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VXfqtRbq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QFYSZKES; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXfqtRbq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFYSZKES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772471271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=43O843P9nsrXz3Z3fOd7BhVl+4E27iRL9ozt9KlrMRI=;
	b=VXfqtRbqOm8hWXHAFrTuof6e0+6XnQ9k6qpxj2zSpxtjAjW9SmnFIxCP1im+lArpGvYULH
	RykjDLbLXoRq/x81MwifuOOs5pAbtCadykCL8Djp80o/F8zJ4lQL5cKQmvrEiYP37XZzEz
	Zk9888kXjP7Ny2AYWxdUYpekHvWjSK4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-B8De0giGPiSzhChlU1ndZw-1; Mon, 02 Mar 2026 12:07:49 -0500
X-MC-Unique: B8De0giGPiSzhChlU1ndZw-1
X-Mimecast-MFC-AGG-ID: B8De0giGPiSzhChlU1ndZw_1772471269
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506b4005ab7so591912361cf.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 09:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772471269; x=1773076069; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43O843P9nsrXz3Z3fOd7BhVl+4E27iRL9ozt9KlrMRI=;
        b=QFYSZKESjuCGaPhZMGFd9ygJhuL4JJeScdUf7nFtPj7Z5vgFbNYrprqBUTsO1NbjZi
         jbh9eUxsY57p2LRDSZXXaa9J8rmGHYgskf8rBFWTMKDVn8cogLmswyol86cmhKSojMC8
         1DCpjorD/RK3CTXmtv3zmfO2tLitJ6v3ENnbPePt8rEWfhNuiUbbeeBNKHw9KGrXgTX1
         Pzk/2J6uXaXDspWRqxMMMqNP1KVg0kyXS00DvA7WHJ3wJe0c/957aSwc6Al5WdTPN8cQ
         FsnYa6IDilfAs0dbQqBWkv4br/oSBHfrfpCwksyqw+wpnQN0GiDPzeeJJ8y+w6yBb1aS
         DnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471269; x=1773076069;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43O843P9nsrXz3Z3fOd7BhVl+4E27iRL9ozt9KlrMRI=;
        b=U0TjtGZrAK5p0W2mcKPK2/tixdGFz08h095z+b/MnnpIjZkpfLt9d0lc/LlvF0pAjb
         Hm0uFhhnn3EQW17kfU1kWRMMFJeREta69Ej8UhYrPxqLpYmQgs9jBq5S9q5+udR3ti0K
         tnGkRNAzURiGtF9oRQpEbmFE454iK35Tcdjut6Sw89G2XbQ2XX29OU4Ro+XnN93vbfHX
         uU1taqPkT9exURui0lDQ4fDvT/NCnWbh+sHDZHQegA7w7CW1Ev+h5tcw2Y7A2CjUDGQH
         6obEBLWu9qesphf5wC/BabyzOjBW0jfq7ym6IcmV9fPxVm5uGtvWyOrLNk0BXmDFU/ui
         a2fA==
X-Forwarded-Encrypted: i=1; AJvYcCUjv2hDhrIJ+FJMMDa7JSwJ2qqkzdxXg4ODdqck+by39W3JNbpOnarjHOHwlLDYRQsrIXxT1FDESUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiyYCOnKKOfvpqeIgRikbxyDsqc3d5IDskoCrRhVhSdGgMsRBw
	3JIcVZRedOnR1nk3EkZ2TTN6eaxLfbUOksFDWMjJfMAF6yP38jbQtPNzYZnQ93YomDgqqb1Bhw+
	ujjmeI4AYX0jLDaVvcdN6yusu1s/23pMp71lNi3wnEfRV5NRldqjVIF0NU/A3LA==
X-Gm-Gg: ATEYQzzI/kN4tz5favzNsK7lo/yCFN5ndQ6uitna5pwocle6Ca65IGi8YZYW3n/oEmM
	AVfW8wv/VXc6TeP72NV06//jPAIaSSTgBoC4NdX6Am13mpR3Bw4GWOkRZpB6CSZqBY8SPyG+QDA
	+sDssdHin6veRrMz39ewnrauFQn4UqYPzRSQv6BgF7dVfSPpGKIRdGM/aC+nIupVh7+qcwtRGYL
	mf3Z9YmZ2vLNtzT38y8q1Mhlb1BXiq23gxmIsfihuNrZjjuve+bQHw2CBAJHB0IkK4xGr1J7Px6
	95++s6eTM7KihhoX2v+wm/pvCxpfrviBXKPWdJKgQlfoQ1vZ4OWa8A8gvuRWpUDqyoqZZvaD40Q
	g28U1t4v+SU+o0kei5vK80bpl18jv8BhtdCM1UDkFlPK/j+vLirv+qZIv
X-Received: by 2002:ac8:5a91:0:b0:501:13f2:e706 with SMTP id d75a77b69052e-50752a280c5mr143149201cf.73.1772471269426;
        Mon, 02 Mar 2026 09:07:49 -0800 (PST)
X-Received: by 2002:ac8:5a91:0:b0:501:13f2:e706 with SMTP id d75a77b69052e-50752a280c5mr143148821cf.73.1772471268983;
        Mon, 02 Mar 2026 09:07:48 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ab3d88sm117087601cf.21.2026.03.02.09.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:07:48 -0800 (PST)
Date: Mon, 2 Mar 2026 12:07:46 -0500
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Kyunghwan Kim <kenkim@coasia.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] clk: samsung: pll: Fix possible truncation in
 a9fraco recalc rate
Message-ID: <aaXD4mlP6814aBfU@redhat.com>
References: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Feb 26, 2026 at 09:54:46PM +0100, Krzysztof Kozlowski wrote:
> samsung_a9fraco_recalc_rate(), unlike other functions in the unit, is
> the first case dividing u64 by u64, thus it should rather use div64_u64
> to avoid possible truncation.  Note that the original code did not
> use remainder.
> 
> This fixes Coccinelle warning:
> 
>   clk-pll.c:1489:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602250053.wEU1hlpY-lkp@intel.com/
> Fixes: f051dc5bc8e7 ("clk: samsung: Add clock PLL support for ARTPEC-9 SoC")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

