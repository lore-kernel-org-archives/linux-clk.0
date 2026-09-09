Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100358494B
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965921; cv=none; b=S/p0uy+DLqdtWgnP0tD8Pf8HqM21wdtGR1VPI6jXPmJwczLUmtqdEpbLuWDa8FKz80KAjKrbSBIVqil+B/Jk6mBxlhETLDX3lydI/nZ266/QRb6vIAMxWRxVRwBfm7wYGIKlEpXCf93FE/ZH39vyV2pSLr2oY/+awde4Rmg8DFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965921; c=relaxed/simple;
	bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Upu1MT1gVI2Bu2lTbCZwnqAIQ8FtX+Rm51uNqjLUBi1WnQdScasiLr9XT7BvwQuASgbJ9aOqSxWxXOYKHNd6+wDXSRA7RPYo4Mtfh3CP67gA4AovpnPdmxVSYTqHjCKIMms8Iu1NSYoD/L/P3Y+g3Xka18rDSgf7u2tXAyZHuwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcrX/Osr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcrX/Osr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso2905425e9.3
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965917; x=1789570717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
        b=gcrX/Osr7jULvPpbVsiR/YE9EUyFW21uf4qekP/mL8NCiWrT1G2PD6OTMxmnXIrSka
         zqfBu5VH68FGtu7lDQVTDlvArzM+4iBhQ5nocWDOLp7d4KKrDA67U+PjVqCsFPgU+7DZ
         ZKE0IKelzKPx5DmCzVdVlSMBGfvaT2ywShlnxBvYgzaZiNssuHexjXI5QPVZDugjDpac
         hYRskKl/Htp256c7oZMUlEvnNlloEPSRqZbz0N7Ja+UgV7SxwsaK9XS9g/kRKaacRT5h
         nJmuTTSDM15tsAc2Yk+K1Vy8KAtovzExAWL1uYxt4Vms3KMrckO0QgYfPM4ni+OzpLVc
         8VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965917; x=1789570717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
        b=mMybYLhjXRVGQwAaTXuPNDZ5vzFGUDQyFPAqsa5lf+j/ojs2k+mGKy0Mmxg4M3TkZi
         NWoWj9SXLGBQhzejkRJdsCBAawdQKT8AVw02D8RzpKNA/Kwjk69Jd9TRi9p/DX+0hbk1
         6aNZq5hEMirrXviWFTHHhZtPrecrU7Sq+MkoudZo8lWOxptFpxv4e9ky3A8LYygNrLWG
         g9OZbPL7jZKz2bQQH7Or4WZzddZG6vxT1/R/f28hmvctPnRFwlONHEkS+HEJA00/dxQQ
         VqWbkxN2hTwW+GAQjeYHASl+YR5n88rn7VhdUcJ2GWIvcAq5Lb8j4RvFI8RH+09/6bxM
         9idQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkacaB9X3u8ukuXr6djExly/xqXVqBT2j7xqJieCoyLrrWo2F8wvZDu6oBscHhMIxWB2tniYA3y1E=@vger.kernel.org
X-Gm-Message-State: AFuF++knAQZBHFAkkzOhPukL2W/5heKEp+fHBitAxM8/XzBHTMI2kDTx
	ES6Nv24oc3C585pUp5UgGy5T9QJMHvvF65fBTeKHdGkjM3Y/yB+UPIuH
X-Gm-Gg: AYBFou3eYIA5em8MfSrFoZ3oj0dKNXREYI4c5IHxQWyvQl42PBiotC6DgmPIr6a68ya
	nLnS48YopMt+akt4K2CM0gcjL+HcXdKvZiLn/V/8Wdkv67tVVnl3ozliMRt0AHs7HQ8b7KQOZDy
	l4I6TJn2VgfuvpEv8SjqYoyQCxDZRLJwavYjkus97ZGmmlKIJPhzKd0SNQV3A/ikZCAlLdXozzX
	saHf4LZCozrfh8FMUfiu9KUwZLZDJsSNBTXSv+51XYSKqu7ZxWPHM6smoGldn/y9595lIqX1MjP
	dsCsA6/TxHgeTOP9yhx7TddzQvevVp/mWZuzkdlhpOOxxlg3Oj4vy8HOZtbrnXcmdlq5RGs2j3x
	3A0dGJOtcrXZpUfkduqvztCvwoT9w9N0wggzeZNw8IZ1ecCwcSya39j7f+4kzr1AKFa2u6zY849
	ahLjBxxPIFpIk0+16NamqzMS8vXYD34Wvwde7KRw9pCXN78gl6lNyNTJKHZb0Z45oAdKGf1xXd2
	VQfHw==
X-Received: by 2002:a05:600c:8b88:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49d2593842emr34218375e9.14.1788965916931;
        Wed, 09 Sep 2026 07:58:36 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm423987255e9.2.2026.09.09.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:36 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:58:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: gregkh@linuxfoundation.org, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de,
	linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v9 1/3] interconnect: mediatek: fix Makefile typo for
 mt8196
Message-ID: <aqF0GLDB5a-P-uvq@stanley.mountain>
References: <20260905130925.7115-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905130925.7115-1-breno3011alves@gmail.com>

What changed between versions?

staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

