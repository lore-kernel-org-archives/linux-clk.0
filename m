Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A9E4334D8
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589461; cv=none; b=pmbv+2phpwAsZPRSZWJCprIXd0UB8wKE2u5Xei/eW9DHK4qH15uZfnhW9fEtSx16sTBCinZ3WHjIxya8mTplZACV2hSKHJ6gS3D8GHuOJFfcKa6EEjwn1HA8qjsNtz6Ys+LF+ACNcHJwiSVgX7h7+XkwjU40S7iIHXhG5sR1ei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589461; c=relaxed/simple;
	bh=hWENBImIPP+6lqHY2Toh7sBtjVGcFhFo/7k7z6+Z4SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkA8gTIbqE5veWI0k7v9+waNaBfReQWkPCzl19reMvQkv4n0wRl3+a1LZCeBxnqBB+N33R+BSiWi+PK0bwhxC66lSW3VSRufLjYZktJoJev84JhGm7UKu29qRSmlVnXUk/8dxlMGqRf4s8vVspnsOqRyU6SaS+JdmJ2jVMLltZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J8TzFRiK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EqL1Nxd8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J8TzFRiK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EqL1Nxd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787589459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EFsaFrYRTmZ8yaCBdCceEEFXMYdp9KxTljIHPL6reDo=;
	b=J8TzFRiKUnho+pbGnvw93+4V0NMcd92BkNbhRPEDIxjrNCusc6D9qPwC+8YTdwgqVre2Vx
	ShIxRaRFzyygA3BFlMX5ycIEqs/mLt1jWxVRdh/XSbRyhvNUDLceQ1f+lnYur5IGDpr8jM
	P1tEiOp2rrPYXGZZKaz/oobH8/8FeIY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-fDNr7Fs8Op-rj5LVOKQsiA-1; Mon, 24 Aug 2026 12:37:37 -0400
X-MC-Unique: fDNr7Fs8Op-rj5LVOKQsiA-1
X-Mimecast-MFC-AGG-ID: fDNr7Fs8Op-rj5LVOKQsiA_1787589457
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52de40127adso41112921cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787589457; x=1788194257; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EFsaFrYRTmZ8yaCBdCceEEFXMYdp9KxTljIHPL6reDo=;
        b=EqL1Nxd8r4K1uThVVSL6ds/W/5HeaWx92aZZbx7gY2ukYTSwL4fDe0O86XEnDUoTd2
         ve+Wb/XwbE5gAEWG2NgrcMa+l6+OvnVuO9nn9bRdloXb4jKAuIh20fPl2rMKTiqp/Pmd
         KR0HteDrjhPepmwgufdXm3T6SJczMxxAB3JDeBwcC2zT2rntk+RYZS/Ebh5+sZtr2UR/
         zGyUAvr7tL6rihp4pJbxY4SbcrMncc4g9CjCEkCSIqds09KY/qnoqQSj1s9SAO3rgBA5
         5RZBgO6u2OFW/qTbdlKoOyxFmM3L3ybneJUIbGVVSh4Mn7cZPMCF5MWALrxzwIFZJ9DU
         TuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589457; x=1788194257;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFsaFrYRTmZ8yaCBdCceEEFXMYdp9KxTljIHPL6reDo=;
        b=JeIZ0YyJkO0B/m0IMPtr5dmAEB3cStdyNeH+zpgKtPNZgReK6oWf8Lwz6vgWhCmWK4
         wvQr1QileCaIIgSPhTKHa4BbeolcTaZt3RPJnqYY58jqu9dVlOIEYaQ2XUYKagOEPZie
         F2mAIQMuZXwfdQNi4HCBgDrOX0YpsZuDKV+4eqs4Mst12KSnyeaFDBdxR71pevhZts3c
         P2MRgKuWeclCqvr0QeCas1proDqtI27MoMmmQNDimAaeCFgLgObK2Li96c4WKWXqOqtD
         XdbcKSnh8M9eWDDlALwVK1uXZvyUPgf2LjM9y109YA6izKihVUtmsRbftd3toygkMpi9
         8uAA==
X-Forwarded-Encrypted: i=1; AHgh+Rojt72hkzm9Poody52rE1xy3hGg4h/dnC7ezbSJBJUgevlDYh9PPxt17K7QRTxMjngrYrzg1B1FUCs=@vger.kernel.org
X-Gm-Message-State: AFuF++lRGtKh/0gs4u7enktb9fdJQkJrzmEwBuDU7x/A2+r/qbk0NXB+
	8FLtvMecXoQXT6Rc/zMtafAUSIIquhngKu3OuuV7QET/rODiyry3v9Cyensd1d2VtKnhSGD/lKG
	z/XGGV6gt1/8WCa/A9lT/aoTtf8YJakBarOqcb669opqFP7fkbMqzPDucbGRGlblMUdh3WcsM
X-Gm-Gg: AR+sD12TMiaCWbWTqzO7t8jZCCNFttm10MXjEPp85jmtBR72C5G6DAnUnDhl6gT60c7
	5jxtQuB++SMETVR9HUks3z91EFu8hIwVUJ1r3r+QsmtC0cdUINCg3HreJ80tTXMGAUkjyV3r69t
	b3A3GWFZGVDoWCuMiRFz1nnsKeKeDIWQeC9rvu/91RpJ0cpocsrqaHz+LKJTdUD8ClzzdjuKXm3
	IsLohs3dJl5jkMMnx/z4yIhkY9fFbcTbAAwk7oOnhD/H1mYotjNRR4b9d2+HztSkQXTOLLdjLxS
	aNgeWpHetpGNGhEiXMxAfDlb0WCHToZyaTickYyE4/bUo+68rl0VbJAFnBCPFZljQK86to6MpAF
	zw9x1EKJRjsF7PwgUgPsFvkjfmJKqvZtHx9o=
X-Received: by 2002:ac8:5714:0:b0:51c:8432:1753 with SMTP id d75a77b69052e-52e09caf410mr169150391cf.30.1787589457114;
        Mon, 24 Aug 2026 09:37:37 -0700 (PDT)
X-Received: by 2002:ac8:5714:0:b0:51c:8432:1753 with SMTP id d75a77b69052e-52e09caf410mr169149781cf.30.1787589456499;
        Mon, 24 Aug 2026 09:37:36 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93614a3dsm65275916d6.19.2026.08.24.09.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:37:35 -0700 (PDT)
Date: Mon, 24 Aug 2026 12:37:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: ultrarisc: Register DP1000 clock provider earlier
Message-ID: <aoxzTneslr61sZmd@redhat.com>
References: <20260820-ultrarisc-clock-fix-v1-1-f27c6a980b42@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-ultrarisc-clock-fix-v1-1-f27c6a980b42@ultrarisc.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Aug 20, 2026 at 10:50:47AM +0800, Jia Wang wrote:
> The DP1000 PCIe and clock drivers both register at the device initcall
> level. Since the PCIe driver is linked first, its probe runs before the
> clock provider is available and defers.
> 
> sysfb_init() runs at the same initcall level before deferred probes are
> retried. It claims the firmware framebuffer aperture, so the later PCIe
> host probe cannot allocate the overlapping prefetchable window and the
> GPU is not enumerated.
> 
> Register the clock provider with subsys_initcall() when built in so PCIe
> host probing completes before sysfb_init(). Keep module builds using the
> normal module init and exit paths.
> 
> Fixes: 3948a36be42b ("clk: ultrarisc: Add DP1000 clock driver")
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

I see this same pattern is also used by lots of qcom gcc drivers, 4
Renesas drivers, and a few other drivers.

Brian

