Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C120335C694
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672929; cv=none; b=Qz+SpKQPD+9yezHpPTxJjkmf1i+LZmbchPlSvCb6LEiPXIxWp8qb5Gkzn1iUPmnUkk/pz2vznfkrLa847JAwwxH16ZyDgBXLxrBDxCpU9sxDKtaxO1z0w1p2d1GA8dTBByyaQYrXeE+Wi8XnCxO9P+Z30cEoJbm2pzcBI5AoEhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672929; c=relaxed/simple;
	bh=nciU3NeuaTSZ8O853ftXD6oFoJxNPsiTyXqRtPWCJEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnX0jlpGmcuOyNUC13AQVOiKVSrGSKoWG2ug6Csf2v+Nf/CApiHWtpcjMrPBvKaYsrA1Y82C6jUYf+U8De/7Jf+AO1q4KUiTwmoSLzfGli0nTTPBGbcXQdi+2aP6dBHjZ6+mIfr4v8B95C3WUmRkcsVKOdfg+UOmTRSS/hmcS8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hGLroGUc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PiBAMlRj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hGLroGUc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PiBAMlRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784672925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JwW1meCVxWROjXbBywYZJqHlMgBxDCAsmiZp91jHxi0=;
	b=hGLroGUcwfU32SALx8Mhg413NVnYKfTPynkOF6w9uDDUHl8Hfv/tLirYFsBLov11mj6mTg
	Yjo41NHcKX5ZZVenBF0jKqWAbOUld7XAWUUB669MUm+bEskMVu0mkVChYcqsrWrkIOlm5w
	4tH+03LImuYpXLn4TBSGnhad11YTCoc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-db1FXvZ0OBy-Tj0pFNAgpA-1; Tue, 21 Jul 2026 18:28:43 -0400
X-MC-Unique: db1FXvZ0OBy-Tj0pFNAgpA-1
X-Mimecast-MFC-AGG-ID: db1FXvZ0OBy-Tj0pFNAgpA_1784672923
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so19327391cf.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 15:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784672923; x=1785277723; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JwW1meCVxWROjXbBywYZJqHlMgBxDCAsmiZp91jHxi0=;
        b=PiBAMlRjoORyxsqjZ/DtanqkRDSyeDjBT8vgo4Ko8+pNLudyIbDEBjuylwOGJY14QB
         kRKYWg+XXA79rEi1j8tKWuDtfuWgc6SGyMRsFhI7UiwHpqa4WsFlf5MgU6VabM75KYBB
         owQvdro48ms09jcy3gS7g7bZ6Nf3K32r+3dwMECYB5iy+6hqCHIUkz+yoaYc/Ho4Rdym
         1W8DqBsfcshE5ylxDM2Km5RhCCAQDoaJyYC1Y8nErFy0RnvQS51nwpjvFkNTYOb3jiyE
         hL3ckMcTHRsS2ncc9eLci56LRiv2a8QF1PDTcnfwMIrMSVy+MkgniWZpTS6duaTqzy4J
         JeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672923; x=1785277723;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwW1meCVxWROjXbBywYZJqHlMgBxDCAsmiZp91jHxi0=;
        b=dLFkZUCSN742tSRQiH69E8SzPyoBnGO6LlmDIGTcyT+LFM1RJDJKIq2+zUAiLUEyB3
         bgcYBPN7s8CXdF6ibvucZHtDodaxTPpLq9IRS+HyWD67NpV1D81v2mO0gd/jk5gz+jZr
         N6RNcHWfw3jb01CxQ+fV4YIoVF4uyvKvK9avJ1TVQT6C0Zk3cDqjye6Bv/hPWPDKk7Oe
         e+f4FgvbFR17i+9g6Idv7QZSh7LajB+rm15SCWZqBn9N9LxYPxZ+4aUwmY2IJGzgraw+
         +uaxQN9/zteavbBMOeg87GpmaSvzebxcROHdx0Ev1Y2OIjRv7hjKujC8brmtnhYTnBrf
         j+cg==
X-Forwarded-Encrypted: i=1; AHgh+Rqf6MBMFSERa2GLIfjL7OH2Wu1TsyGVnOjCJW+JPEqUxfyqdxnbfboZjDGqAxL6FziLTwgzQk4APdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5l7KXp2/Nl9QsC0AYQC+Ddx91uqVxZofdM8ecH8Pz6OgU10/
	zRvKLYyb/FtT4L/L39PPw9pQEivp/8a6kO5G0cwBLBAKSSsynj0Hx96vIfwrg8gUWoWBShL241u
	L6H9OLQC9Sc/cKffHN836V7Np78RpgPMXi7qQNIozBx9rcKvj8iobSbUbKeLVxA==
X-Gm-Gg: AR+sD12lWLxpZmc49IkNm5NhRvlO72obGUjYqqgxqGBMOHymMRAkYWWXzHlxpiY+Hio
	1q8QrEImUGz6WYFurcQiw/Sp2Vt+6iy7Nkg1abLrzugM1cEiJK/K3ek6Iw9zI1znJlWc9cTAAHS
	ELm8a/WcJZptC2ECeW/Yj3V2kP4HIss+YnSqYTO8+2SaUI83P9llWbYkbrVHeCorJ2BtFNQfwzc
	0TKboHgmO2ua+zhjHFThWNA7BQUqomsp3fO43vWIYz6ckkPzx617H3RWQB6+yZvNc4Yo0W+XLyf
	uCMQ9ncFFIkI/r2tq9ZyfukHA3x8vSZWO3ZtsDFaaOGd71K87+tbKyHDwqtdeP5F9atYlFCSMOI
	waj19sqT8nGFuHFvjd+pfx++CvOeaITrvofQ=
X-Received: by 2002:a05:622a:e083:10b0:527:631:8d6 with SMTP id d75a77b69052e-52706310c66mr28308541cf.25.1784672922985;
        Tue, 21 Jul 2026 15:28:42 -0700 (PDT)
X-Received: by 2002:a05:622a:e083:10b0:527:631:8d6 with SMTP id d75a77b69052e-52706310c66mr28308411cf.25.1784672922597;
        Tue, 21 Jul 2026 15:28:42 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b31dcsm6627526d6.3.2026.07.21.15.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:28:42 -0700 (PDT)
Date: Tue, 21 Jul 2026 18:28:40 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v4 3/7] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
Message-ID: <al_ymM6jjh8xmAPw@redhat.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-3-751547e160e5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-3-751547e160e5@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 17, 2026 at 05:59:19PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Make sure this helper is never broken, especially since we will soon
> make some changes in it.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

